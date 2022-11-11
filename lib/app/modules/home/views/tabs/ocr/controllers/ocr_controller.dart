import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OcrController extends GetxController {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  late File imageTaken;
  RxBool isImageTaken = false.obs;
  RxBool isInitialized = false.obs;

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
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
    await cameraController!.initialize().then((v) {
      isInitialized.value = true;
      // if (Get.routing.current != "/home") {
      //   return ;
      // }
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
          button(Icons.camera),
          (isImageTaken.value) ? Image.file(imageTaken) : Container()
        ],
      );
    });
  }

  Widget button(IconData iconData) {
    return GestureDetector(
      onTap: () {
        cameraController?.takePicture().then((XFile? file) {
          if (Get.routing.current != "/home") {
            if (file != null) {
              print("file saved at ${file.path}");
              imageTaken = File(file.path);
              isImageTaken.value = true;
            }
          }
        });
        cameraController?.pausePreview();
        // widget.panelController.open();
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
              child: Icon(
                iconData,
                size: 48,
              )),
        ),
      ),
    );
  }
}
