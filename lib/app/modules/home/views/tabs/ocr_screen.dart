import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halalin/app/modules/home/controllers/home_controller.dart';

class OcrScreen extends StatelessWidget {
  const OcrScreen({Key? key}) : super(key: key);
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
                              ? const Text('Data is Empty')
                              : SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    itemCount: controller.result.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading:
                                            Text(controller.result[index].kode),
                                        title: Text(
                                            controller.result[index].status),
                                        trailing:
                                            Text(controller.result[index].name),
                                      );
                                    },
                                  ),
                                )
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
