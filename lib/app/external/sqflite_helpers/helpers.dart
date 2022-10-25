import 'package:desafio_apirest/app/domain/constants/constants_app.dart';
import 'package:desafio_apirest/app/domain/constants/sql_tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHelpers {
  SqfliteHelpers._();

  static final SqfliteHelpers instance = SqfliteHelpers._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), ConstantsApp.nameDatabase),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(SqlTables.tableCart);
  }
}
