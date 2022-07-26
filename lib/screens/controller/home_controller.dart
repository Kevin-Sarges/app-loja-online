import 'package:desafio_apirest/provider/product_provider.dart';
import 'package:desafio_apirest/screens/controller/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeInicial());
  ProductProvider provider = ProductProvider(dio: Dio());

  Future<void> listarProdutos() async {
    value = HomeLoading();
    try {
      final result = await provider.getProduct();
      value = HomeSucesso(result!);
    } catch (e) {
      value = HomeSucesso([]);
    }
  }
}
