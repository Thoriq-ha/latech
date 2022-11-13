import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.movePage();
    return Scaffold(
      body: Container(
          color: primary,
          child: Stack(
            children: [
              // Obx((() => ())),
              logoAnimation(),
              topOrnament(),
              bottomOrnament()
            ],
          )),
    );
  }

  Widget logoAnimation() {
    return AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              logo,
              scale: 1,
            )));
  }

  Widget topOrnament() {
    return AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.easeIn,
        child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              ornamentTop,
              scale: 2,
            )));
  }

  Widget bottomOrnament() {
    return AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.easeIn,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              ornamentBottom,
              scale: 1.4,
            )));
  }
}
