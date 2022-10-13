import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';

class SqfliteService implements ICart {
  @override
  Future<void> addCart(Map<String, dynamic> addProductCart) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>?> listProductCart(List<ProductModel> productsCart) {
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> removeCart(ProductModel removeProduct) {
    throw UnimplementedError();
  }

  @override
  Future<void> cleanCart() {
    throw UnimplementedError();
  }
}
