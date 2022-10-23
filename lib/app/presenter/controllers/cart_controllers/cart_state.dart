import 'package:desafio_apirest/app/data/model/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSucess extends CartState {
  List<ProductModel> productCart;

  CartSucess(this.productCart);
}

class CartAddProduct extends CartState {}

class CartRemoveProduct extends CartState {}

class CartError extends CartState {
  String error;

  CartError(this.error);
}
