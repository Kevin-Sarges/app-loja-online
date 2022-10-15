import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService implements ICart {
  final nameTable = 'cart';
  late Database _db;

  @override
  Future setLocalDatabase() async {
    _db = await openDatabase('shopping_cart', version: 1,
        onCreate: (_db, version) async {
      await _db.execute('''
        create table $nameTable(
          ${ConstantsApp.id} integer primary key autoincrement,
          ${ConstantsApp.title} text not null,
          ${ConstantsApp.price} decimal not null,
          ${ConstantsApp.category} text not null,
          ${ConstantsApp.description} text not null,
          ${ConstantsApp.image} text not null, 
          ${ConstantsApp.rating} text not null,
        )
      ''');
    });
  }

  @override
  Future<ProductModel> addCart(ProductModel product) async {
    product.id = await _db.insert(nameTable, product.toJson());

    return product;
  }

  @override
  Future<List<Map<String, dynamic>>> listProductCart() async {
    final products = await _db.query('cart', columns: [
      ConstantsApp.title,
      ConstantsApp.price,
      ConstantsApp.image,
    ]);

    return products;
  }

  @override
  Future<int> removeCart(int id) async {
    return await _db.delete(nameTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> cleanCart() async {
    return await _db.delete(nameTable);
  }
}
