import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:get/get.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/services/halal_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  RxList<Ingredient> data = RxList();
  List<String> kode = [];
  RxList<String> result = RxList();

  RxString ocrText = ''.obs;
  String lang = "eng";
  RxString path = "".obs;
  RxBool bload = false.obs;

  Future<void> getData() async {
    var res = await HalalServices.getDataService();
    data.addAll(res);
    kode.clear();
    for (var v in res) {
      kode.add(v.kode);
    }
  }

  Future<List<String>> getResult({required String input}) async {
    await getData();
    result.clear();

    var res = await HalalServices.getHalal(input: input, listDataset: kode);
    result.addAll(res);
    return res;
  }

  void ocr(url) async {
    path.value = url;
    if (kIsWeb == false &&
        (url.indexOf("http://") == 0 || url.indexOf("https://") == 0)) {
      Directory tempDir = await getTemporaryDirectory();
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      String dir = tempDir.path;
      File file = File('$dir/test.jpg');
      await file.writeAsBytes(bytes);
      url = file.path;
    }
    bload.value = true;

    ocrText.value =
        await FlutterTesseractOcr.extractText(url, language: lang, args: {
      "preserve_interword_spaces": "1",
    });
    await getResult(input: ocrText.value);
    bload.value = false;
  }

  void runFilePiker() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ocr(pickedFile.path);
    }
  }

  // Future<void> writeToFile(ByteData data, String path) {
  //   final buffer = data.buffer;
  //   return File(path).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }
}
