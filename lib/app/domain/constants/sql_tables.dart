import 'package:desafio_apirest/app/domain/constants/constants_app.dart';

class SqlTables {
  static String get tableCart => '''
    CREATE TABLE ${ConstantsApp.nameTable} (
      ${ConstantsApp.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${ConstantsApp.image} TEXT NOT NULL,
      ${ConstantsApp.title} TEXT NOT NULL,
      ${ConstantsApp.price} REAL NOT NULL
    )
  ''';
}
