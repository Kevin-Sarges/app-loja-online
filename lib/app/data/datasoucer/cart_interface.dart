import 'package:desafio_apirest/app/data/model/cart_model.dart';

abstract class IDataBaseLocal {
  Future<List<CartModel>> getProductListCart();
  Future<CartModel> saveProductCart(CartModel product);
  Future<double> sumPrice();
  Future<void> onDelete(int id);
  Future<void> clearCart();
}
