import 'package:desafio_apirest/app/data/services/http_clients/dio_client.dart';
import 'package:desafio_apirest/app/data/services/product_service.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/controller_list_products/list_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductsController extends Cubit<ListProductsState> {
  ProductProvider provider = ProductProvider(DioClient());

  ListProductsController() : super(ListProductsInitial());

  Future<void> listProduct() async {
    emit(ListProductsLoading());

    try {
      final result = await provider.getProduct(ConstantsApp.url);

      emit(ListProductsSucess(result));
    } catch (e) {
      emit(ListProductsError('Erro ao lista os produtos'));
    }
  }
}
