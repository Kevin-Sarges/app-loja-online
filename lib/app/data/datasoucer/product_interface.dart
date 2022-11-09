import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class IGetProductApi {
  Future<List<ProductModel>?> getProduct(String uri);
}
