import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class ICart {
  Future<void> listProductCart();
  Future<void> addCart(ProductModel product);
  Future<void> removeCart(int id);
  Future<void> cleanCart();
}
