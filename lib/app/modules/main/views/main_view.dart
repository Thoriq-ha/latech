import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
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
            tabItem(Iconsax.home, 0, controller.currentIndex.value),
            tabItemwithSize(Iconsax.scan, 1, controller.currentIndex.value, 32),
            tabItem(Iconsax.bookmark, 2, controller.currentIndex.value),
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
  TabItem tabItemwithSize(IconData icon, currentIndex, index, double size) {
    return (index == currentIndex)
        ? TabItem(
        icon: Icon(
          icon,
          color: primary,
          size: size,
        ))
        : TabItem(
      icon: Icon(
        icon,
        color: Colors.grey,
        size: size,
      ),
    );
  }
}
