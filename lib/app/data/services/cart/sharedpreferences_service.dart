import 'dart:convert';

import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices implements ICart {
  SharedPreferences? sharedPreferences;
  int? indexProductDeleted;
  ProductModel? productModel;
  List<ProductModel> productsCart = [];

  double priceTotal = 0.0;
  final storage = LocalStorage(ConstantsApp.nameDatabase);

  @override
  Future<List<ProductModel>?> getProductListCart() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final String jsonString =
        sharedPreferences?.getString(ConstantsApp.cartListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveProductCart(ProductModel products) async {
    final jsonString = json.encode(products);

    sharedPreferences?.setString(ConstantsApp.nameDatabase, jsonString);
    storage.setItem(ConstantsApp.nameDatabase, jsonString);
  }

  @override
  Future<void> onDelete(int id) async {
    ProductModel? product;

    productModel = product;
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
