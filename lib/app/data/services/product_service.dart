import 'package:desafio_apirest/app/data/datasoucer/http_client_interface.dart';
import 'package:desafio_apirest/app/data/datasoucer/product_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';

class ProductProvider implements IProduct {
  ProductProvider(this.client);

  final IHttpClient client;

  @override
  Future<List<ProductModel>?> getProduct(String uri) async {
    final body = await client.get(uri);

    return ProductModel.fromJsonList(body as List);
  }
}
