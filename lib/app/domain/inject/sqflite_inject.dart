import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/services/cart/sqflite_service.dart';
import 'package:desafio_apirest/app/presenter/view/cart/controller_cart/cart_controller.dart';
import 'package:desafio_apirest/app/presenter/view/home/controller_home/home_controller.dart';
import 'package:get_it/get_it.dart';

class SqfliteInject {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<IDataBaseLocal>(
      SqfliteService(),
    );

    getIt.registerFactory<HomeController>(() => HomeController());

    getIt.registerFactory<CartController>(() => CartController(getIt()));
  }
}
