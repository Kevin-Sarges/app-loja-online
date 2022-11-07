import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  final List<ProductModel>? result;

  HomeSucess(this.result);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
