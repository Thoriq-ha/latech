import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  List<TabItem> tabItem = [
    TabItem(
        icon: Icon(
      Icons.apps,
      color: primary,
    )),
    TabItem(
        icon: Icon(
      Icons.camera,
      color: primary,
    )),
    TabItem(
        icon: Icon(
      Icons.settings,
      color: primary,
    ))
  ];

  @override
  Widget build(BuildContext context) {
    PanelController panelController = PanelController();
    return Scaffold(body: Obx(() {
      return controller.viewBody[controller.currentIndex.value];
    }), bottomNavigationBar: Obx(() {
      return ConvexAppBar(
          activeColor: Colors.black,
          style: TabStyle.fixedCircle,
          initialActiveIndex: controller.currentIndex.value,
          backgroundColor: Colors.white,
          color: Colors.amber,
          onTap: (index) {
            controller.currentIndex.value = index;
            // if (controller.currentIndex.value == cameraNavBarIndex) {
            //   Get.toNamed(Routes.OCR);
            // }
          },
          items: tabItem);
    }));
  }
}
