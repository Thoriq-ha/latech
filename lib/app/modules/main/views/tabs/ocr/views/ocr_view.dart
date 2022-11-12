import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/modules/main/views/tabs/ocr/controllers/ocr_controller.dart';
import 'package:halalin/app/modules/main/views/tabs/ocr/views/text_recognizer_view.dart';
import 'package:halalin/app/routes/app_pages.dart';

class OcrView extends GetView<OcrController> {
  const OcrView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(Routes.MAIN);
        return true;
      },
      child: Scaffold(
        body: TextRecognizerView(),
      ),
    );
  }
}
