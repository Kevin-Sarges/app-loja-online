import 'package:desafio_apirest/model/product_model.dart';

abstract class HomeState {}

class HomeInicial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucesso extends HomeState {
  final List<ProductModel> lista;
  HomeSucesso(this.lista);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
