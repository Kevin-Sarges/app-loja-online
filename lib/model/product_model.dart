// ignore_for_file: unnecessary_null_comparison

import 'package:desafio_apirest/model/rating_model.dart';

class ProductModel {
  late int id;
  late String title;
  late double price;
  late String category;
  late String description;
  late String image;
  late RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    price = json['price'] is int
        ? (json['price'] as int).toDouble()
        : json['price'];
    category = json['category'] as String;
    description = json['description'] as String;
    image = json['image'] as String;
    rating = RatingModel.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['image'] = image;
    data['rating'] = rating;

    return data;
  }

  static List<ProductModel>? fromJsonList(List list) {
    if (list == null) {
      return null;
    }

    return list.map((map) => ProductModel.fromJson(map)).toList();
  }
}
