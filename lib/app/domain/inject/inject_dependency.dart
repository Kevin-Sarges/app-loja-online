import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/services/auth/google_auth_service.dart';
import 'package:desafio_apirest/app/data/services/cart/sqflite_service.dart';
import 'package:desafio_apirest/app/presenter/view/cart/controller_cart/cart_controller.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/screen/list_products_screen.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_controller.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<IDataBaseLocal>(
      SqfliteService(),
    );

    getIt.registerSingleton<IAuthUser>(
      GoogleAuthService(),
    );

    getIt.registerFactory<LoginController>(
      () => LoginController(getIt()),
    );

    getIt.registerFactory<ListProductsScreen>(() => const ListProductsScreen());

    getIt.registerFactory<CartController>(
      () => CartController(getIt()),
    );
  }
}
