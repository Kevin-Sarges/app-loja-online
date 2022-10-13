import 'package:desafio_apirest/app/data/datasoucer/http_client_interface.dart';
import 'package:desafio_apirest/app/data/datasoucer/product_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';

class ProductProvider implements IProduct {
  final IHttpClient client;

  ProductProvider(this.client);

  @override
  Future<List<ProductModel>?> getProduct(String uri) async {
    final body = await client.get(uri);

    return ProductModel.fromJsonList(body as List);
  }

  @override
  Future<Map<String, dynamic>> addCart(Map<String, dynamic> addProductCart) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>?> listProductCart(List<ProductModel> productsCart) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> cleanCart(List<ProductModel> productsCart) {
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> removeCart(ProductModel removeProduct) {
    throw UnimplementedError();
  }
}
