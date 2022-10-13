import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class ICart {
  Future<List<ProductModel>?> listProductCart(List<ProductModel> productsCart);
  Future<void> addCart(Map<String, dynamic> addProductCart);
  Future<ProductModel> removeCart(ProductModel removeProduct);
  Future<void> cleanCart();
}
