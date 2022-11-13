import 'package:get/get.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/data/services/product_services.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList();
  final RxList<Product> _tempProduct = RxList();
  final RxList<Product> savedProduct = RxList();

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

    if (savedProduct.isEmpty) {
      var resSavedProd = PreferencesService.getDataBookmarkProduct();
      savedProduct.addAll(resSavedProd);
      setLabelBookmarkProduct();
    }
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

  Future<void> updateSaveDataBookmarkProduct() async {
    await PreferencesService.savedDataBookmarkProduct(produks: savedProduct);
  }

  Future<void> setLabelBookmarkProduct() async {
    products.asMap().forEach((index, value) {
      if (savedProduct.contains(value)) {
        products[index].is_bookmark = true;
      } else {
        products[index].is_bookmark = false;
      }
      products.refresh();
    });
  }
}
