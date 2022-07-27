import 'package:desafio_apirest/app/data/services/dio_client.dart';
import 'package:desafio_apirest/app/data/services/product_service.dart';
import 'package:desafio_apirest/app/presenter/controllers/home_state.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  ProductProvider provider = ProductProvider(DioClient());

  HomeController() : super(HomeInitial());

  Future<void> listProduct() async {
    value = HomeLoading();

    try {
      final result = await provider.getProduct();

      value = HomeSucess(result);
    } catch (e) {
      value = HomeError(e.toString());
    }
  }
}
