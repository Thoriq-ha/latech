import 'dart:convert';

class Ingredient {
  String kode;
  String name;
  String tipe;
  String desc;
  List<String> status;

  Ingredient(
      {required this.desc,
      required this.kode,
      required this.tipe,
      required this.name,
      required this.status});

  factory Ingredient.fromJson(Map json) {
    return Ingredient(
        desc: json['desc'],
        tipe: json['tipe'],
        kode: json['kode'],
        name: json['name'],
        status: (json['status'] as List).map((e) => e.toString()).toList());
  }
}
