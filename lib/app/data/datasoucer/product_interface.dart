import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class IProduct {
  Future<List<ProductModel>?> getProduct(String uri);
}
