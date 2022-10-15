import 'package:desafio_apirest/app/data/services/dio_client.dart';
import 'package:desafio_apirest/app/data/services/product_service.dart';
import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:desafio_apirest/app/presenter/controllers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeState> {
  ProductProvider provider = ProductProvider(DioClient());

  HomeController() : super(HomeInitial());

  Future<void> listProduct() async {
    emit(HomeLoading());

    try {
      final result = await provider.getProduct(ConstantsApp.url);

      emit(HomeSucess(result));
    } catch (e) {
      emit(HomeError('Erro ao lista os produtos'));
    }
  }
}
