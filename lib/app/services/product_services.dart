import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:halalin/app/data/models/product.dart';

class ProductServices {
  // HalalServices();
  // static final HalalServices _instance = HalalServices._internal();
  // static HalalServices get instance => _instance;
  // HalalServices._internal();

  // get dataset
  static Future<List<Product>> getDataProduct() async {
    var load = await rootBundle.loadString('assets/dataset/data_products.json');
    var data = json.decode(load);
    List<Product> ingredients =
        (data['data'] as List).map((v) => Product.fromJson(v)).toList();
    return ingredients;
  }
}
