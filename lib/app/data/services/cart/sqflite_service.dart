// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqlite_api.dart';

import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:desafio_apirest/app/external/sqflite_helpers/helpers.dart';

class SqfliteService implements ICart {
  Database db;

  SqfliteService({required this.db});

  List<ProductModel> product = [];

  List<ProductModel> get productCart => product;

  @override
  Future<List<ProductModel>?> getProductListCart() async {
    db = await SqfliteHelpers.instance.database;

    List<Map<String, dynamic>> maps =
        await db.query(ConstantsApp.nameTable, columns: [
      ConstantsApp.image,
      ConstantsApp.title,
      ConstantsApp.price,
    ]);

    if (maps.isNotEmpty) {
      product = ProductModel.fromJsonList(maps)!;
    }

    return product;
  }

  @override
  Future<ProductModel> saveProductCart(ProductModel product) async {
    db = await SqfliteHelpers.instance.database;
    product.id = await db.insert(ConstantsApp.nameTable, product.toJson());

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
}
