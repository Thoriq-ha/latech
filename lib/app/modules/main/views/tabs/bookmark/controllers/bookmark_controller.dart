import 'dart:convert';

import 'package:get/get.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

class BookmarkController extends GetxController {
  RxList<Product> bookmarks = RxList();

  @override
  void onInit() {
    getDataBookmarkProduct();
    super.onInit();
  }

  Future<void> getDataBookmarkProduct() async {
    var res = await PreferencesService.getDataBookmarkProduct();
    bookmarks.clear();
    bookmarks.addAll(res);
  }
}
