import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:halalin/app/data/models/ingredient.dart';

class HalalServices {
  static Future<List<Ingredient>> getDataService() async {
    var load = await rootBundle.loadString('assets/dataset/dataset\.json');
    var data = json.decode(load);
    List<Ingredient> ingredients =
        (data['data'] as List).map((v) => Ingredient.fromJson(v)).toList();
    return ingredients;
  }

  static Future<List<String>> getHalal(
      {required String input, required List<String> listDataset}) async {
    List<String> listInput = input.split(' ');
    List<String> output = [];
    for (var v in listInput) {
      var h = v.replaceAll(RegExp(r'[^\w\s]+'), '');
      for (var ds in listDataset) {
        if (ds.toLowerCase() == h) {
          output.add(h);
        }
      }
    }
    return output;
  }
}
