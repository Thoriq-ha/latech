import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/data/services/service_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  var data = PreferencesService.pref;
  List<Product> lp = [
    Product(
        nama: 'nama1',
        ingredient: 'ingredient',
        gambar: 'gambar',
        is_bookmark: false),
    Product(
        nama: 'nama2',
        ingredient: 'ingredient',
        gambar: 'gambar',
        is_bookmark: false),
    Product(
        nama: 'nama3',
        ingredient: 'ingredient',
        gambar: 'gambar',
        is_bookmark: false),
    Product(
        nama: 'nama4',
        ingredient: 'ingredient',
        gambar: 'gambar',
        is_bookmark: false),
  ];
  List<String> listString = lp.map((e) => json.encode(e.toMap())).toList();
  data.setStringList('taged', listString);

  List<String> getData = data.getStringList('taged') as List<String>;
  List<Product> lp2 =
      getData.map((e) => Product.fromJson(json.decode(e))).toList();

  print(lp2[0].nama);
}
