import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PanelController panelController = PanelController();
    return Scaffold(body: Obx(() {
      return controller.viewBody[controller.currentIndex.value];
    }), bottomNavigationBar: Obx(() {
      return ConvexAppBar(
          style: TabStyle.fixedCircle,
          initialActiveIndex: controller.currentIndex.value,
          color: primaryAccent,
          backgroundColor: primaryAccent,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: [
            tabItem(Icons.apps, 0, controller.currentIndex.value),
            tabItem(Icons.camera, 1, controller.currentIndex.value),
            tabItem(Icons.settings, 2, controller.currentIndex.value),
            ]);
    }));
  }

  TabItem tabItem(IconData icon, currentIndex,index){
    return  (index == currentIndex)
        ? TabItem(
        icon: Icon(
          icon,
          color: primary,
        )): TabItem(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),);
  }
}
