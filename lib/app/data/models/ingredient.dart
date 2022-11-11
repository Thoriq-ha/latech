class Ingredient {
  String kode;
  String name;
  String desc;
  String status;

  Ingredient(
      {required this.desc,
      required this.kode,
      required this.name,
      required this.status});

  factory Ingredient.fromJson(Map json) {
    return Ingredient(
        desc: json['desc'],
        kode: json['kode'],
        name: json['name'],
        status: json['status']);
  }
}
