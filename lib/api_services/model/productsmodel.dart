// To parse this JSON data, do
//
//     final productsModeal = productsModealFromJson(jsonString);

import 'dart:convert';

List<ProductsModeal> productsModealFromJson(String str) =>
    List<ProductsModeal>.from(
        json.decode(str).map((x) => ProductsModeal.fromJson(x)));

String productsModealToJson(List<ProductsModeal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModeal {
  ProductsModeal({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.subImg,
    this.isSlected,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  bool? isSlected;
  List<String>? subImg;
  Rating? rating;

  factory ProductsModeal.fromJson(Map<String, dynamic> json) => ProductsModeal(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        isSlected: json["isSelected"],
        subImg: List<String>.from(json["sub_img"].map((x) => x)),
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "isSelected": isSlected,
        "sub_img": List<dynamic>.from(subImg!.map((x) => x)),
        "rating": rating!.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
