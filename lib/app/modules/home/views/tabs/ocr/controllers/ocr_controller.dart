import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/modules/home/controllers/home_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OcrController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  PanelController panelController = PanelController();
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  late File imageTaken;
  RxBool isImageTaken = false.obs;
  RxBool isInitialized = false.obs;
  RxList<Ingredient> resultIngredient = RxList();

  @override
  void onInit() {
    startCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController!.dispose();
    super.onClose();
  }

  Future<void> startCamera() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras[0], ResolutionPreset.low, enableAudio: false);
    await cameraController!.initialize().then((v) {
      isInitialized.value = true;
    }).catchError((e) {
      print(e.code);
    });
  }

  Widget cameraPreview() {
    cameraController?.resumePreview();
    return Obx(() {
      return Stack(
        children: [
          (isInitialized.value)
              ? CameraPreview(cameraController!)
              : Container(),
          (isImageTaken.value)
              ? Image.file(imageTaken)
              : GestureDetector(
                  onTap: () async {
                    XFile? file = await cameraController?.takePicture();
                    if (file != null) {
                      print("file saved at ${file.path}");
                      imageTaken = File(file.path);
                      isImageTaken.value = true;
                    }
                    cameraController?.pausePreview();
                    setOcr();
                    panelController.open();
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FittedBox(
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 120),
                          height: 64,
                          width: 64,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Icon(
                            Icons.camera,
                            size: 48,
                          )),
                    ),
                  ),
                ),
          // (isImageTaken.value) ? Container() : Container()
        ],
      );
    });
  }

  Future<void> setOcr() async {
    var res = await homeController.ocr(imageTaken.path);
    resultIngredient.addAll(res);
  }
}
