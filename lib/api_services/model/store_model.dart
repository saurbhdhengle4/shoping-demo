// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  StoreModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.logo,
    this.image,
    this.like,
    this.communts,
  });

  int? id;
  String? title;
  String? description;
  String? category;
  String? logo;
  String? image;
  String? like;
  String? communts;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        logo: json["logo"],
        image: json["image"],
        like: json["like"],
        communts: json["communts"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "logo": logo,
        "image": image,
        "like": like,
        "communts": communts,
      };
}
