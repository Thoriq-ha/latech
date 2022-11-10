import 'package:get/get.dart';
import 'package:halalin/app/data/models/ingredient.dart';
import 'package:halalin/app/services/halal_services.dart';

class HomeController extends GetxController {
  RxList<Ingredient> data = RxList();
  List<String> kode = [];
  RxList<String> result = RxList();

  @override
  void onInit() {
    getData();
  }

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
}
