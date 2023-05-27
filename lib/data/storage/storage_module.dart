import 'package:calendar_app/data/storage/db_helper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DBModule {
  @Singleton(dispose: disposeDb)
  @factoryMethod
  Future<DatabaseHelper> createDb() async {
    final database = DatabaseHelper();
    await database.open();
    return database;
  }
}

Future disposeDb(DatabaseHelper database) {
  return database.close();
}