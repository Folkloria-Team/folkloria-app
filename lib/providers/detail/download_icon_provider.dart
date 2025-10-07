import 'package:flutter/widgets.dart';

class DownloadIconProvider extends ChangeNotifier {
  bool _isDownloaded = false;

  bool get isDownloaded => _isDownloaded;

  set isDownloaded(bool value) {
    _isDownloaded = value;
    notifyListeners();
  }
}