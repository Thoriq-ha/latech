import 'package:get/get.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/data/services/product_services.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList();
  final RxList<Product> _tempProduct = RxList();
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    var res = await ProductServices.getDataProduct();
    products.clear();
    products.addAll(res);
    _tempProduct.clear();
    _tempProduct.addAll(res);
  }

  void searchProduct({required String query}) {
    if (query != '') {
      var res = _tempProduct
          .where(
              (v) => (v.nama.contains(query) || v.ingredient.contains(query)))
          .toList();
      products.clear();
      products.addAll(res);
    }
  }
}
