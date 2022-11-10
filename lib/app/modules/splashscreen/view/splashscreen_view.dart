import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:halalin/app/routes/app_pages.dart';


class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.movePage();
    return Scaffold(
      body: Container(
        color: primary,
        child: Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }
}