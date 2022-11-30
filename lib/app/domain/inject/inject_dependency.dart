import 'package:desafio_apirest/app/data/datasoucer/auth_interface.dart';
import 'package:desafio_apirest/app/data/datasoucer/cart_interface.dart';
import 'package:desafio_apirest/app/data/datasoucer/map_location_interface.dart';
import 'package:desafio_apirest/app/data/services/auth/google_auth_service.dart';
import 'package:desafio_apirest/app/data/services/cart/sqflite_service/sqflite_service.dart';
import 'package:desafio_apirest/app/data/services/map/google_maps_service.dart';
import 'package:desafio_apirest/app/presenter/view/cart/controller_cart/cart_controller.dart';
import 'package:desafio_apirest/app/presenter/view/list_products/controller_list_products/list_products_controller.dart';
import 'package:desafio_apirest/app/presenter/view/login/controller_login/login_controller.dart';
import 'package:desafio_apirest/app/presenter/view/map/controllers_map/map_controller.dart';
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

    getIt.registerSingleton<IMapLocation>(
      GoogleMapsService(),
    );

    getIt.registerFactory<LoginController>(
      () => LoginController(getIt()),
    );

    getIt.registerFactory<ListProductsController>(
      () => ListProductsController(),
    );

    getIt.registerFactory<CartController>(
      () => CartController(getIt()),
    );

    getIt.registerFactory<MapController>(
      () => MapController(getIt()),
    );
  }
}
