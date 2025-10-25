import 'package:flutter/foundation.dart';
import 'package:folkloria/data/models/story.dart';

class DownloadListProvider extends ChangeNotifier {
  final List<Story> _downloadList = [];

  List<Story> get downloadList => _downloadList;

  // Tambahkan ke daftar download
  void addDownload(Story story) {
    final alreadyDownloaded = _downloadList.any((item) => item.id == story.id);
    if (!alreadyDownloaded) {
      _downloadList.add(story);
      notifyListeners();
    }
  }

  // Hapus dari daftar download
  void removeDownload(Story story) {
    _downloadList.removeWhere((item) => item.id == story.id);
    notifyListeners();
  }

  // Cek apakah cerita sudah di-download
  bool checkItemDownloaded(Story story) {
    return _downloadList.any((item) => item.id == story.id);
  }
}
