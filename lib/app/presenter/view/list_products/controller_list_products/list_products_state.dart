import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class ListProductsState {}

class ListProductsInitial extends ListProductsState {}

class ListProductsLoading extends ListProductsState {}

class ListProductsSucess extends ListProductsState {
  final List<ProductModel>? result;

  ListProductsSucess(this.result);
}

class ListProductsError extends ListProductsState {
  final String message;

  ListProductsError(this.message);
}
