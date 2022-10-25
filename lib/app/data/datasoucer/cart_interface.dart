import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class ICart {
  Future<void> getProductListCart();
  Future<void> saveProductCart(ProductModel product);
  Future<void> onDelete(int id);
  Future<void> clearCart();
}
