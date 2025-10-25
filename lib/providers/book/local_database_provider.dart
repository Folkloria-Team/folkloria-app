import 'package:flutter/foundation.dart';
import 'package:folkloria/data/services/local_database_service.dart';
import 'package:folkloria/data/models/story.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  final LocalDatabaseService _service;

  LocalDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

  List<Story> _favoriteList = [];
  List<Story> get favoriteList => _favoriteList;

  List<Story> _downloadList = [];
  List<Story> get downloadList => _downloadList;

  Story? _story;
  Story? get story => _story;

  // ================= FAVORIT =================
  Future<void> loadAllFavoriteValue() async {
    try {
      _favoriteList = await _service.getAllItemFavorites();
      _message = "Semua favorit berhasil dimuat";
      notifyListeners();
    } catch (e) {
      _message = "Gagal memuat daftar favorit";
      notifyListeners();
    }
  }

  Future<void> saveFavoriteValue(Story value) async {
    try {
      final result = await _service.insertItemFavorite(value);
      if (result != 0) {
        _favoriteList.add(value);
        _message = "Cerita berhasil ditambahkan ke favorit";
        notifyListeners();
      } else {
        _message = "Gagal menambahkan ke favorit";
        notifyListeners();
      }
    } catch (e) {
      _message = "Gagal menyimpan ke favorit";
      notifyListeners();
    }
  }

  Future<void> removeFavoriteValueById(String id) async {
    try {
      await _service.removeItemFavorite(id);
      _favoriteList.removeWhere((book) => book.id == id);
      _message = "Cerita dihapus dari favorit";
      notifyListeners();
    } catch (e) {
      _message = "Gagal menghapus dari favorit";
      notifyListeners();
    }
  }

  bool checkItemFavorite(String id) {
    return _favoriteList.any((book) => book.id == id);
  }

  /// ✅ Fungsi tambahan untuk load favorit by ID (fix error)
  Future<bool> loadFavoriteValueById(String id) async {
    try {
      final story = await _service.getItemFavoriteById(id);
      return story != null;
    } catch (e) {
      return false;
    }
  }

  // ================= DOWNLOAD =================
  Future<void> loadAllDownloadValue() async {
    try {
      _downloadList = await _service.getAllItemDownloads();
      _message = "Semua unduhan berhasil dimuat";
      notifyListeners();
    } catch (e) {
      _message = "Gagal memuat daftar unduhan";
      notifyListeners();
    }
  }

  Future<void> saveDownloadValue(Story value) async {
    try {
      final result = await _service.insertItemDownload(value);
      if (result != 0) {
        _downloadList.add(value);
        _message = "Cerita berhasil diunduh";
        notifyListeners();
      } else {
        _message = "Gagal menyimpan unduhan";
        notifyListeners();
      }
    } catch (e) {
      _message = "Gagal menyimpan unduhan";
      notifyListeners();
    }
  }

  Future<void> removeDownloadValueById(String id) async {
    try {
      await _service.removeItemDownload(id);
      _downloadList.removeWhere((book) => book.id == id);
      _message = "Unduhan dihapus";
      notifyListeners();
    } catch (e) {
      _message = "Gagal menghapus unduhan";
      notifyListeners();
    }
  }

  bool checkItemDownload(String id) {
    return _downloadList.any((book) => book.id == id);
  }

  /// ✅ Fungsi tambahan untuk load unduhan by ID (fix error)
  Future<bool> loadDownloadValueById(String id) async {
    try {
      final story = await _service.getItemDownloadById(id);
      return story != null;
    } catch (e) {
      return false;
    }
  }
}
