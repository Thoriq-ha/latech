import 'package:flutter/cupertino.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:get/get.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr/views/text_detector_view.dart';
import 'package:halalin/app/services/halal_services.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxList<Ingredient> data = RxList();
  RxList<Ingredient> result = RxList();
  RxInt currentIndex = 0.obs;
  List<Widget> viewBody = [
    const Center(child: Text('Setting')),
    TextRecognizerView(),
    const Center(child: Text('Setting')),
  ];

  RxString ocrText = ''.obs;
  String lang = "eng";
  RxString path = "".obs;
  RxBool bload = false.obs;

  Future<void> getData() async {
    data.clear();
  }

  Future<List<Ingredient>> getResult({required String input}) async {
    await getData();
    result.clear();
    var res = await HalalServices.getHalal(input: input);
    result.addAll(res);
    return res;
  }

  Future<List<Ingredient>> ocr(url) async {
    path.value = url;
    bload.value = true;

    ocrText.value =
        await FlutterTesseractOcr.extractText(url, language: lang, args: {
      "preserve_interword_spaces": "1",
    });
    print(ocrText.value);
    List<Ingredient> res = await getResult(input: ocrText.value);
    print(res);
    bload.value = false;
    return res;
  }

  void runFilePiker() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ocr(pickedFile.path);
    }
  }
}
