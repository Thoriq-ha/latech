import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/data/services/halal_services.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:halalin/app/ui/status.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
        body: FutureBuilder<RecognizedText>(
          future: textRecognizer.processImage(inputImage),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return Stack(
                children: [
                  SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.file(
                        inputFile,
                        fit: BoxFit.cover,
                      )),
                  bottomResult(context, snapshot),
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

  SlidingUpPanel bottomResult(
      BuildContext context, AsyncSnapshot<RecognizedText> snapshot) {
    return SlidingUpPanel(
      controller: controller.slidingController,
      minHeight: 60,
      isDraggable: true,
      header: Container(
        height: 60,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: IconButton(
            onPressed: () {
              if (controller.slidingController.panelPosition == 1) {
                controller.slidingController.animatePanelToPosition(0);
              } else {
                controller.slidingController.animatePanelToPosition(1);
              }
            },
            icon: const Icon(Icons.linear_scale)),
      ),
      panel: ListView(
        children: [
          Container(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              'Recognized Image :',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(snapshot.data!.text,
                textAlign: TextAlign.justify, maxLines: 5),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              'E-CODE Inggredients :',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          if (snapshot.data != null)
            FutureBuilder<List<Ingredient>>(
              future: HalalServices.getHalal(input: snapshot.data!.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Result Is Empty ',
                          textAlign: TextAlign.justify),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Container(
                      color: Colors.white,
                      height: (200.0 * snapshot.data!.length),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var dataResult = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Stack(
                              children: [
                                Image.asset(resultCard),
                                Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: SizedBox(
                                    height: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(dataResult.name,
                                            style:
                                                const TextStyle(fontSize: 14)),
                                        Text(
                                          dataResult.kode,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children:
                                                label(ingred: dataResult)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            )
          else
            const Text('Result is Empty')
        ],
      ),
    );
  }
}
