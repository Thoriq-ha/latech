import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          print(controller.result.value);
          if (controller.data.isNotEmpty) {
            String input = 'Ini adalah tex (e304, @e101';
            return Column(
              children: [
                Row(
                  children: [
                    Text('Input : $input '),
                  ],
                ),
                Text('Hasil : ${controller.result} '),
                ElevatedButton(
                    onPressed: () async {
                      await controller.getResult(input: input);
                    },
                    child: Text('Cek'))
              ],
            );
          } else {
            return Text('Loading');
          }
        }),
      ),
    );
  }
}
