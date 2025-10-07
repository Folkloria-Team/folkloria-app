// todo-01-service-03: create a service that handle a database services

import 'package:folkloria/data/models/book.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  // todo-01-service-04: make a static value
  static const String _databaseName = 'booklist.db';
  static const String _tableFavorite = 'favorite';
  static const String _tableDownload = 'download';
  static const int _version = 1;

  // todo-01-service-05: add a table to create a table
  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableFavorite(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        rating REAL
      )""");
    await database.execute("""CREATE TABLE $_tableDownload(
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
  Future<int> insertItemFavorite(Book book) async {
    final db = await _initializeDb();

    final data = book.toJson();
    final id = await db.insert(
      _tableFavorite,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Book>> getAllItemFavorites() async {
    final db = await _initializeDb();
    final results = await db.query(_tableFavorite, orderBy: "id");

    return results.map((result) => Book.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Book> getItemFavoriteById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableFavorite,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Book.fromJson(result)).first;
  }

  // todo-01-service-11: delete an item by id
  Future<String> removeItemFavorite(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableFavorite,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.toString();
  }

  // Download Table Operations
  // todo-01-service-07: create new item
  Future<int> insertItemDownload(Book book) async {
    final db = await _initializeDb();

    final data = book.toJson();
    final id = await db.insert(
      _tableDownload,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Book>> getAllItemDownloads() async {
    final db = await _initializeDb();
    final results = await db.query(_tableDownload, orderBy: "id");

    return results.map((result) => Book.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Book> getItemDownloadById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableDownload,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Book.fromJson(result)).first;
  }

  // todo-01-service-11: delete an item by id
  Future<String> removeItemDownload(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableDownload,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.toString();
  }
}
