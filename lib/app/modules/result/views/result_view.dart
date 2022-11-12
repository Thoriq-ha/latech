import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:halalin/app/services/halal_services.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    File inputFile = Get.arguments;
    final TextRecognizer textRecognizer =
        TextRecognizer(script: TextRecognitionScript.chinese);
    InputImage? inputImage;

    inputImage = InputImage.fromFilePath(inputFile.path);

    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(Routes.MAIN);
            },
          ),
        ),
        body: FutureBuilder<RecognizedText>(
          future: textRecognizer.processImage(inputImage),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return ListView(
                children: [
                  SizedBox(height: 400, child: Image.file(inputFile)),
                  Text('Recognized Image :\n\n ${snapshot.data!.text}',
                      textAlign: TextAlign.justify, maxLines: 5),
                  FutureBuilder<List<Ingredient>>(
                    future: HalalServices.getHalal(input: snapshot.data!.text),
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data![index];
                            return ListTile(
                              leading: Text(data.kode),
                              title: Text(data.status),
                              trailing: Text(data.name),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
