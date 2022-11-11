import 'package:flutter/cupertino.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:get/get.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/modules/home/views/tabs/ocr_screen.dart';
import 'package:halalin/app/services/halal_services.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxList<Ingredient> data = RxList();
  RxList<Ingredient> result = RxList();
  RxInt currentIndex = 0.obs;
  List<Widget> viewBody = [
    OcrScreen(),
    Center(child: Text('Scan')),
    Center(child: Text('Setting')),
  ];

  RxString ocrText = ''.obs;
  String lang = "eng";
  RxString path = "".obs;
  RxBool bload = false.obs;

  Future<void> getData() async {
    data.clear();
    var res = await HalalServices.getDataService();
    data.addAll(res);
  }

  Future<void> getResult({required String input}) async {
    await getData();

    result.clear();
    var res = await HalalServices.getHalal(input: input, ingrident: data.value);
    result.addAll(res);
  }

  void ocr(url) async {
    path.value = url;
    // if (kIsWeb == false &&
    //     (url.indexOf("http://") == 0 || url.indexOf("https://") == 0)) {
    //   Directory tempDir = await getTemporaryDirectory();
    //   HttpClient httpClient = HttpClient();
    //   HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    //   HttpClientResponse response = await request.close();
    //   Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    //   String dir = tempDir.path;
    //   File file = File('$dir/test.jpg');
    //   await file.writeAsBytes(bytes);
    //   url = file.path;
    // }
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
