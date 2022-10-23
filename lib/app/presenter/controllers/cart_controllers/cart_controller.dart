import 'package:desafio_apirest/app/data/model/product_model.dart';
import 'package:desafio_apirest/app/data/services/cart/sharedpreferences_service.dart';
import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends Cubit<CartState> {
  CartController() : super(CartInitial());

  final service = SharedPreferencesServices();

  Future<void> cartProductList() async {
    emit(CartLoading());

    try {
      final cartProduct = await service.getProductListCart();

      emit(CartSucess(cartProduct!));
    } catch (e) {
      emit(
        CartError(
          'erro ao lista produtos do carrinho !!',
        ),
      );
    }
  }

  void addCart(List<ProductModel> product) async {
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

  void deleteProductCart(ProductModel product) async {
    emit(CartLoading());

    try {
      service.onDelete(product);

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
