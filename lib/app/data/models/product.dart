// "nama": "oriental viandes extra tendre halal",
// "ingredient": "beef halal, Water, flavouring, beet, bamboo fiber, Spice, Salt",
// "gambar": "https://media.auchan.fr/A0220201013000043692PRIMARY_1500x1500/B2CD/"

class Product {
  String nama;
  String ingredient;
  String gambar;
  bool is_bookmark;

  Product({
    required this.nama,
    required this.ingredient,
    required this.gambar,
    required this.is_bookmark,
  });

  factory Product.fromJson(Map json) {
    return Product(
      nama: json['nama'],
      ingredient: json['ingredient'],
      gambar: json['gambar'],
      is_bookmark: false,
    );
  }

  toMap() {
    return {
      'nama': nama,
      'ingredient': ingredient,
      'gambar': gambar,
      'is_bookmark': is_bookmark,
    };
  }
}
