import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ocr_controller.dart';

class OcrView extends GetView<OcrController> {
  const OcrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.cameraController);
    if (controller.cameraController?.value.isInitialized ?? true) {
      return controller.cameraPreview();
    }
    //  else if (controller.isImageTaken.value) {
    // return Obx(() {
    //   return Image.file(controller.imageTaken);
    // });
    // }
    else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
