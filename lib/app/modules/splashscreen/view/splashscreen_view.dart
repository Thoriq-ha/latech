import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:halalin/app/routes/app_pages.dart';

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
             logoAnimation(),
             topOrnament(),
             bottomOrnament()
            ],
          )),
    );
  }

  Widget logoAnimation(){
    
    return  AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.fastOutSlowIn,
                  child: Align(
                      alignment: Alignment.center, child: Image.asset(logo, scale: 1.4, opacity: AlwaysStoppedAnimation(controller.opacity.value) ,)));
  }

  Widget topOrnament(){
    return  AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.easeIn,
                  child: Align(
                      alignment: Alignment.topLeft, child: Image.asset(ornamentTop, scale:  1.4,))); 
  }

  Widget bottomOrnament(){
    return  AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.easeIn,
                  child: Align(
                      alignment: Alignment.bottomRight, 
                      child: Image.asset(ornamentBottom, scale: 1.4,))); 
  }


}
