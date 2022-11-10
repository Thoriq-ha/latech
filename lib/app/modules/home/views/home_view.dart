import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(child: Obx(() {
                  return ListView(
                    children: [
                      controller.path.isEmpty
                          ? Container()
                          : Image.file(File(controller.path.value)),
                      controller.bload.value
                          ? Column(
                              children: const [CircularProgressIndicator()])
                          : controller.result.isEmpty
                              ? const Text('Is Empty')
                              : Text(controller.result.toString()),
                    ],
                  );
                }))
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: kIsWeb
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                controller.runFilePiker();
              },
              tooltip: 'OCR',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
