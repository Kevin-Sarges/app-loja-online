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

      emit(CartSucess(cartProduct, priceTotal));
    } catch (e) {
      emit(
        CartError(
          e.toString(),
          // 'erro ao lista produtos do carrinho !! ',
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

  Future<void> deleteProductCart(CartModel product) async {
    try {
      await service.onDelete(product.id);

      await cartProductList();
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
