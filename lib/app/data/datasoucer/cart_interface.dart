import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class ICart {
  Future<void> getProductListCart();
  void saveProductCart(List<ProductModel> products);
  void onDelete(ProductModel product);
  void clearCart();
}
