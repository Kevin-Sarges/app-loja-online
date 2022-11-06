import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/services/cart/sqflite_service.dart';
import 'package:desafio_apirest/app/presenter/controllers/cart_controllers/cart_controller.dart';
import 'package:desafio_apirest/app/presenter/controllers/home_controllers/home_controller.dart';
import 'package:get_it/get_it.dart';

class SqfliteInject {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerFactory(() => HomeController());

    getIt.registerSingleton<IDataBaseLocal>(
      SqfliteService(),
    );

    getIt.registerFactory(
      () => CartController(getIt()),
    );
  }
}
