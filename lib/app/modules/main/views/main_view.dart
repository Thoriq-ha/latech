import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/routes/app_pages.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        return controller.viewBody[controller.currentIndex.value];
      },
    ), bottomNavigationBar: Obx(() {
      return ConvexAppBar(
          style: TabStyle.fixedCircle,
          initialActiveIndex: controller.currentIndex.value,
          color: primaryAccent,
          backgroundColor: primaryAccent,
          onTap: (index) async {
            controller.currentIndex.value = index;
            if (controller.currentIndex.value == 1) {
              await Get.toNamed(Routes.OCR);
              controller.currentIndex.value = 0;
            }
          },
          items: [
            tabItem(Icons.home_outlined, 0, controller.currentIndex.value),
            tabItem(Icons.photo_camera_outlined, 1, controller.currentIndex.value),
            tabItem(Icons.bookmark_border, 2, controller.currentIndex.value),
          ]);
    }));
  }

  TabItem tabItem(IconData icon, currentIndex, index) {
    return (index == currentIndex)
        ? TabItem(
            icon: Icon(
            icon,
            color: primary,
          ))
        : TabItem(
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
          );
  }
}
