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
    listDataset.add('halal');

    print(input);
    List<String> listInput = input.multiSplit([' ', '-', '\n']);
    Set<String> output = {};
    print(listInput.toString());
    for (var v in listInput) {
      var h = v.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
      for (var ds in listDataset) {
        if (ds.toLowerCase() == h) {
          output.add(h);
        }
      }
    }
    return output.toList();
  }
}

extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));
}
