import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr/controllers/ocr_controller.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr/views/text_detector_view.dart';

class OcrView extends GetView<OcrController> {
  const OcrView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextRecognizerView(),
    );
  }
}
