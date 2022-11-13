import 'dart:convert';

import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences pref;

  static init() async => pref = await SharedPreferences.getInstance();

  static List<Product> getDataBookmarkProduct() {
    var data = (pref.getStringList(BOOKMARK_KEY) != null)
        ? (pref.getStringList(BOOKMARK_KEY) as List<String>)
        : [];
    return data.map((e) => Product.fromJson(json.decode(e))).toList();
  }

  static Future<void> savedDataBookmarkProduct(
      {required List<Product> produks}) async {
    List<String> listString =
        produks.map((e) => json.encode(e.toMap())).toList();
    pref.setStringList(BOOKMARK_KEY, listString);
  }
}
