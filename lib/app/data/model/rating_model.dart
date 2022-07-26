// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_apirest/app/domain/entities/product_rating.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    required double rate,
    required int count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate:
          json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate'],
      count: json['count'] as int,
    );
  }
}
