import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService implements ICart {
  late Database _db;

  @override
  Future setLocalDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), ConstantsApp.nameDatabase),
        version: 1, onCreate: (db, version) async {
      await db.execute('''
        create table ${ConstantsApp.nameTable}(
          ${ConstantsApp.id} integer primary key autoincrement,
          ${ConstantsApp.title} text not null,
          ${ConstantsApp.price} real not null,
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
    product.id = await _db.insert(ConstantsApp.nameTable, product.toJson());

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
    return await _db.delete(
      ConstantsApp.nameTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<int> cleanCart() async {
    return await _db.delete(ConstantsApp.nameTable);
  }
}
