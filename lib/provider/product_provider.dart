import 'package:desafio_apirest/model/product_model.dart';
import 'package:dio/dio.dart';

const String uri = 'https://fakestoreapi.com/products';
final request = Uri.parse(uri);

class ProductProvider {
  final dio = Dio();

  Future<List<ProductModel>?> getProduct() async {
    final response = await dio.get(uri);
    final body = response.data as List;

    return ProductModel.fromJsonList(body);
  }
}
