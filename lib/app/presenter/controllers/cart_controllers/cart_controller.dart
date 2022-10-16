import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/data/services/sqflite_service.dart';
import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends Cubit<CartState> {
  CartController() : super(CartInitial());

  final service = SqfliteService();

  Future<void> cartProductList() async {
    emit(CartLoading());

    try {
      final cartProduct = await service.cartProductList();

      emit(CartSucess(cartProduct));
    } catch (e) {
      emit(
        CartError(
          'erro ao lista produtos do carrinho !!',
        ),
      );
    }
  }

  Future<void> addCart(ProductModel product) async {
    emit(CartLoading());

    try {
      final addProduct = await service.addCart(product);

      emit(CartAddProduct(addProduct));
    } catch (e) {
      emit(
        CartError('Erro ao adicionar produto no carrinho'),
      );
    }
  }

  Future<void> deleteProductCart(int id) async {
    emit(CartLoading());

    try {
      await service.removeCart(id);

      emit(CartRemoveProduct());
    } catch (e) {
      emit(
        CartError('Erro ao remover produto !!'),
      );
    }
  }

  Future<void> cleanCart() async {
    emit(CartLoading());

    try {
      await service.cleanCart();
    } catch (e) {
      emit(
        CartError('Erro ao limpar o carrinho !!'),
      );
    }
  }
}
