import 'package:flutter/foundation.dart';
import 'package:folkloria/data/models/story.dart';
import 'package:folkloria/data/services/local_database_service.dart';

class DownloadIconProvider extends ChangeNotifier {
  final LocalDatabaseService _localDb = LocalDatabaseService();

  /// daftar story yang sudah diunduh
  List<Story> _downloadedStories = [];
  List<Story> get downloadedStories => _downloadedStories;

  /// Load semua story yang sudah diunduh dari database
  Future<void> loadAllDownloads() async {
    try {
      _downloadedStories = await _localDb.getAllItemDownloads();
      notifyListeners();
    } catch (e) {
      debugPrint('⚠️ Gagal memuat daftar unduhan: $e');
    }
  }

  /// Mengecek apakah story dengan ID tertentu sudah diunduh
  bool isStoryDownloaded(String id) {
    return _downloadedStories.any((story) => story.id == id);
  }

  /// Tambah story ke database dan update state
  Future<void> addDownload(Story story) async {
    try {
      await _localDb.insertItemDownload(story);
      _downloadedStories.add(story);
      notifyListeners();
    } catch (e) {
      debugPrint('⚠️ Gagal menambahkan unduhan: $e');
    }
  }

  /// Hapus story dari database dan update state
  Future<void> removeDownload(String id) async {
    try {
      await _localDb.removeItemDownload(id);
      _downloadedStories.removeWhere((story) => story.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('⚠️ Gagal menghapus unduhan: $e');
    }
  }

  /// Toggle status download (persisten)
  Future<void> toggleDownload(Story story) async {
    try {
      if (isStoryDownloaded(story.id)) {
        await removeDownload(story.id);
      } else {
        await addDownload(story);
      }
    } catch (e) {
      debugPrint('! Error saat toggle download: $e');
    }
  }
}
