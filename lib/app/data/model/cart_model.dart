import 'package:desafio_apirest/app/domain/entities/cart_entities.dart';

class CartModel extends CartEntities {
  CartModel({
    required int id,
    required String title,
    required String price,
    required String image,
  }) : super(
          id: id,
          title: title,
          price: price,
          image: image,
        );

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['image'] = image;

    map['id'] = id;
    return map;
  }

  static List<CartModel>? fromJsonList(List list) {
    return list.map((map) => CartModel.fromMap(map)).toList();
  }
}
