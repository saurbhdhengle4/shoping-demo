import 'dart:convert';

List<CartModeal> productsModealFromJson(String str) =>
    List<CartModeal>.from(json.decode(str).map((x) => CartModeal.fromJson(x)));

String productsModealToJson(List<CartModeal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModeal {
  CartModeal({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.subImg,
    this.discount,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  List<String>? subImg;
  Rating? discount;
  Rating? rating;

  factory CartModeal.fromJson(Map<String, dynamic> json) => CartModeal(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        subImg: List<String>.from(json["sub_img"].map((x) => x)),
        discount: json["discount"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "sub_img": List<dynamic>.from(subImg!.map((x) => x)),
        "discount": discount,
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
