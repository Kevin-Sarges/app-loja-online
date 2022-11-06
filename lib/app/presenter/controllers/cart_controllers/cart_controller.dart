import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/model/cart_model.dart';
import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends Cubit<CartState> {
  CartController(this.service) : super(CartInitial());

  final IDataBaseLocal service;

  Future<void> cartProductList() async {
    emit(CartLoading());

    try {
      final cartProduct = await service.getProductListCart();
      final priceTotal = await service.sumPrice();

      emit(CartPriceTotal(priceTotal));
      emit(CartSucess(cartProduct));
    } catch (e) {
      emit(
        CartError(
          'erro ao lista produtos do carrinho !!',
        ),
      );
    }
  }

  Future<void> addCart(CartModel product) async {
    emit(CartLoading());

    try {
      service.saveProductCart(product);

      emit(CartAddProduct());
    } catch (e) {
      emit(
        CartError('Erro ao adicionar produto no carrinho'),
      );
    }
  }

  void deleteProductCart(CartModel product) async {
    emit(CartLoading());

    try {
      service.onDelete(product.id);

      emit(CartRemoveProduct());
    } catch (e) {
      emit(
        CartError('Erro ao remover produto !!'),
      );
    }
  }

  void cleanCart() async {
    emit(CartLoading());

    try {
      service.clearCart();
    } catch (e) {
      emit(
        CartError('Erro ao limpar o carrinho !!'),
      );
    }
  }
}
