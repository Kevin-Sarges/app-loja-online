// ignore_for_file: unnecessary_null_comparison

import 'package:desafio_apirest/app/data/model/rating_model.dart';
import 'package:desafio_apirest/app/domain/entities/product_entity.dart';
import 'package:desafio_apirest/app/domain/entities/product_rating.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String title,
    required double price,
    required String category,
    required String description,
    required String image,
    required RatingEntity rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          category: category,
          description: description,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] is int
          ? (json['price'] as int).toDouble()
          : json['price'],
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      rating: RatingModel.fromJson(json['rating']),
    );
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
    return list.map((map) => ProductModel.fromJson(map)).toList();
  }
}
