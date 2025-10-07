import 'package:flutter/widgets.dart';
import 'package:folkloria/data/services/local_database_service.dart';
import 'package:folkloria/data/models/book.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  final LocalDatabaseService _service;

  LocalDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

  List<Book>? _favoriteList;
  List<Book>? get favoriteList => _favoriteList;

  List<Book>? _downloadList;
  List<Book>? get downloadList => _downloadList;

  Book? _book;
  Book? get book => _book;

  Future<void> saveFavoriteValue(Book value) async {
    try {
      final result = await _service.insertItemFavorite(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  Future<void> loadAllFavoriteValue() async {
    try {
      _favoriteList = await _service.getAllItemFavorites();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  Future<void> loadFavoriteValueById(String id) async {
    try {
      _book = await _service.getItemFavoriteById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeFavoriteValueById(String id) async {
    try {
      await _service.removeItemFavorite(id);

      _message = "Your data is removed";
      notifyListeners();
      loadAllFavoriteValue();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }

  bool checkItemFavorite(String id) {
    final isSameFavorite = _book?.id == id;
    return isSameFavorite;
  }

  // Download Table Operations
  Future<void> saveDownloadValue(Book value) async {
    try {
      final result = await _service.insertItemDownload(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  Future<void> loadAllDownloadValue() async {
    try {
      _downloadList = await _service.getAllItemDownloads();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  Future<void> loadDownloadValueById(String id) async {
    try {
      _book = await _service.getItemDownloadById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeDownloadValueById(String id) async {
    try {
      await _service.removeItemDownload(id);

      _message = "Your data is removed";
      notifyListeners();
      loadAllDownloadValue();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }

  bool checkItemDownload(String id) {
    final isSameBook = _book?.id == id;
    return isSameBook;
  }
}
