// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:desafio_apirest/app/data/model/cart_model.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:desafio_apirest/app/external/sqflite_helpers/helpers.dart';

class SqfliteService implements IDataBaseLocal {
  late Database db;

  List<CartModel> product = [];

  List<CartModel> get productCart => product;

  @override
  Future<List<CartModel>> getProductListCart() async {
    db = await SqfliteHelpers.instance.database;

    List<Map<String, dynamic>> maps = await db.query(ConstantsApp.nameTable);

    if (maps.isNotEmpty) {
      product = CartModel.fromJsonList(maps)!;
    }

    return product;
  }

  @override
  Future<CartModel> saveProductCart(CartModel product) async {
    db = await SqfliteHelpers.instance.database;
    await db.insert(ConstantsApp.nameTable, product.toMap());

    return product;
  }

  @override
  Future<void> onDelete(int id) async {
    db = await SqfliteHelpers.instance.database;

    await db.delete(
      ConstantsApp.nameTable,
      where: '${ConstantsApp.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> clearCart() async {
    db = await SqfliteHelpers.instance.database;

    await db.delete(ConstantsApp.nameTable);

    productCart.clear();
  }

  @override
  Future<double> sumPrice() async {
    db = await SqfliteHelpers.instance.database;

    List<Map<String, dynamic>> total = await db.rawQuery(
      'SELECT SUM(${ConstantsApp.price}) FROM ${ConstantsApp.nameTable}',
    );

    double priceTotal = total[0]['SUM(${ConstantsApp.price})'] ?? 0.0;

    return priceTotal;
  }
}
