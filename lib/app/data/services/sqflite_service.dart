import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService implements ICart {
  String? id;
  String? title;
  String? price;
  String? category;
  String? description;
  String? image;
  String? rating;

  final nameTable = 'cart';
  late Database db;

  Future setDatabase() async {
    db = await openDatabase('shopping_cart', version: 1,
        onCreate: (db, version) async {
      await db.execute('''
        create table $nameTable(
          $id integer primary key autoincrement,
          $title text not null,
          $price decimal not null,
          $category text not null,
          $description text not null,
          $image text not null, 
          $rating text not null,
        )
      ''');
    });
  }

  @override
  Future<ProductModel> addCart(ProductModel product) async {
    product.id = await db.insert(nameTable, product.toJson());

    return product;
  }

  @override
  Future<ProductModel> listProductCart(
    List<ProductModel> productsCart,
  ) async {
    final products = await db.query('cart', columns: [
      title!,
      price!,
      image!,
    ]);

    return ProductModel.fromJson(products);
  }

  @override
  Future<int> removeCart(int id) async {
    return await db.delete(nameTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> cleanCart() async {
    return await db.delete(nameTable);
  }
}
