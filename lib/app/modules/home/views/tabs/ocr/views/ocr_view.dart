import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/ocr_controller.dart';

class OcrView extends GetView<OcrController> {
  const OcrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PanelController panelController = PanelController();
    return Scaffold(
        body: SlidingUpPanel(
            maxHeight: getDeviceHeight(context) * 0.8,
            minHeight: 0,
            controller: controller.panelController,
            panel: Obx(() {
              return Center(
                  child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: controller.resultIngredient.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(controller.resultIngredient[index].kode),
                      title: Text(controller.resultIngredient[index].status),
                      trailing: Text(controller.resultIngredient[index].name),
                    );
                  },
                ),
              ));
            }),
            body: myCamera()));
  }

  Widget myCamera() {
    if (controller.cameraController?.value.isInitialized ?? true) {
      return controller.cameraPreview();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
