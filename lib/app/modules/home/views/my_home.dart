import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/modules/home/controllers/home_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
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
