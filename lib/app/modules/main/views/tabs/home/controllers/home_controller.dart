import 'package:get/get.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/services/product_services.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList();
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    products.clear();
    var res = await ProductServices.getDataProduct();
    products.addAll(res);
  }
}
