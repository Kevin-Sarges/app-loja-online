import 'package:desafio_apirest/app/data/datasoucer/http_client_interface.dart';
import 'package:desafio_apirest/app/data/model/product_model.dart';

const uri = 'https://fakestoreapi.com/products';

class ProductProvider {
  final IHttpClient client;

  ProductProvider(this.client);

  Future<List<ProductModel>?> getProduct() async {
    final body = await client.get(uri);

    return ProductModel.fromJsonList(body as List);
  }
}
