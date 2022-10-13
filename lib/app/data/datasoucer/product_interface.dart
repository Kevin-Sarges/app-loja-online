import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class IProduct {
  Future<List<ProductModel>?> getProduct(String uri);
  Future<List<ProductModel>?> listProductCart(List<ProductModel> productsCart);
  Future<Map<String, dynamic>> addCart(Map<String, dynamic> addProductCart);
  Future<ProductModel> removeCart(ProductModel removeProduct);
  Future<List<ProductModel>> cleanCart(List<ProductModel> productsCart);
}
