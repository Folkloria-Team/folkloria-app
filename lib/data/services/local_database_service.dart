// todo-01-service-03: create a service that handle a database services

import 'package:folkloria/data/models/story.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  // todo-01-service-04: make a static value
  static const String _databaseName = 'storylist.db';
  static const String _tableFavorite = 'favorite';
  static const String _tableDownload = 'download';
  static const int _version = 1;

  // todo-01-service-05: add a table to create a table
  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableFavorite(
        id TEXT PRIMARY KEY,
        provinceId TEXT,
        title TEXT,
        sinopsis TEXT,
        content TEXT,
        cover TEXT,
        island TEXT
      )""");
    await database.execute("""CREATE TABLE $_tableDownload(
        id TEXT PRIMARY KEY,
        provinceId TEXT,
        title TEXT,
        sinopsis TEXT,
        content TEXT,
        cover TEXT,
        island TEXT
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
  Future<int> insertItemFavorite(Story story) async {
    final db = await _initializeDb();

    final data = story.toJson();
    final id = await db.insert(
      _tableFavorite,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Story>> getAllItemFavorites() async {
    final db = await _initializeDb();
    final results = await db.query(_tableFavorite, orderBy: "id");

    return results.map((result) => Story.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Story> getItemFavoriteById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableFavorite,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Story.fromJson(result)).first;
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
  Future<int> insertItemDownload(Story story) async {
    final db = await _initializeDb();

    final data = story.toJson();
    final id = await db.insert(
      _tableDownload,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  // todo-01-service-08: read all items
  Future<List<Story>> getAllItemDownloads() async {
    final db = await _initializeDb();
    final results = await db.query(_tableDownload, orderBy: "id");

    return results.map((result) => Story.fromJson(result)).toList();
  }

  // todo-01-service-09: get a single item by id
  Future<Story> getItemDownloadById(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableDownload,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.map((result) => Story.fromJson(result)).first;
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
