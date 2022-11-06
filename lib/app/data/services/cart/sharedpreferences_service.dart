import 'dart:convert';

import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/cart_model.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices implements IDataBaseLocal {
  SharedPreferences? sharedPreferences;
  int? indexProductDeleted;
  CartModel? productCart;
  List<CartModel> productsCart = [];

  double priceTotal = 0.0;
  final storage = LocalStorage(ConstantsApp.nameDatabase);

  @override
  Future<List<CartModel>> getProductListCart() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final String jsonString =
        sharedPreferences?.getString(ConstantsApp.cartListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded.map((e) => CartModel.fromMap(e)).toList();
  }

  @override
  Future<CartModel> saveProductCart(CartModel products) async {
    final jsonString = json.encode(products);

    sharedPreferences?.setString(ConstantsApp.nameDatabase, jsonString);
    storage.setItem(ConstantsApp.nameDatabase, jsonString);

    return products;
  }

  @override
  Future<void> onDelete(int id) async {
    CartModel? product;

    productCart = product;
    indexProductDeleted = productsCart.indexOf(product!);

    priceTotal = priceTotal - product.price;

    productsCart.remove(product);
  }

  @override
  Future<void> clearCart() async {
    await storage.clear();

    productsCart.clear();
    productsCart = storage.getItem('items') ?? [];
  }
}
