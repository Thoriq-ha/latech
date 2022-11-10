import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/modules/home/views/camera_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    PanelController panelController = PanelController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SlidingUpPanel(
        maxHeight: getDeviceHeight(context) * 0.8,
        minHeight: 0, 
        controller: panelController,
        panel: Center(
          child: Text("wakwaw"),
        ),
        body: CameraScreen(panelController: panelController,))
    );
  }
}
