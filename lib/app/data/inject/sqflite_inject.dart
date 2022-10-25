import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/services/cart/sqflite_service.dart';
import 'package:get_it/get_it.dart';

class SqfliteInject {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<ICart>(
      SqfliteService(
        db: getIt(),
      ),
    );
  }
}
