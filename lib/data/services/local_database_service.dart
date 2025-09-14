import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static const String _databaseName = 'folklotia.db';
  static const String _tableName = 'book';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
      )""");
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }
}
