import 'package:flutter/foundation.dart';
import 'package:folkloria/data/models/story.dart';

class FavoriteListProvider extends ChangeNotifier {
  final List<Story> _favoriteList = [];

  List<Story> get favoriteList => _favoriteList;

  // Tambahkan ke daftar favorit
  void addFavorite(Story story) {
    final alreadyAdded = _favoriteList.any((item) => item.id == story.id);
    if (!alreadyAdded) {
      _favoriteList.add(story);
      notifyListeners();
    }
  }

  // Hapus dari daftar favorit
  void removeFavorite(Story story) {
    _favoriteList.removeWhere((item) => item.id == story.id);
    notifyListeners();
  }

  // Cek apakah cerita sudah difavoritkan
  bool checkItemFavorite(Story story) {
    return _favoriteList.any((item) => item.id == story.id);
  }
}
