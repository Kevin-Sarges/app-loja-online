import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  HomeSucess(List<ProductModel>? result);
}

class HomeError extends HomeState {
  HomeError(String error);
}
