// todo-01-service-03: create a service that handle a database services

import 'package:folkloria/data/models/book.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  // todo-01-service-04: make a static value
  static const String _databaseName = 'booklist.db';
  static const String _tableName = 'book';
  static const int _version = 1;

  // todo-01-service-05: add a table to create a table
  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        rating REAL
      )""");
  }

  // todo-01-service-06: make connection with database
  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // todo-01-service-07: create new item
  Future<int> insertItem(Book book) async {
    final db = await _initializeDb();

    final data = book.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Book>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName, orderBy: "id");

    return results.map((result) => Book.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Book> getItemById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Book.fromJson(result)).first;
  }

  // todo-01-service-11: delete an item by id
  Future<String> removeItem(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.toString();
  }
}
