import 'package:flutter/widgets.dart';
import 'package:folkloria/data/models/dark_mode.dart';
import 'package:folkloria/data/services/shared_preferences_service.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  final SharedPreferencesService _service;

  SharedPreferencesProvider(this._service);

  String _message = "";
  String get message => _message;

  DarkMode? _darkMode;
  DarkMode? get darkMode => _darkMode;

  Future<void> saveDarkModeValue(DarkMode value) async {
    try {
      await _service.saveDarkModeValue(value);
      _message = "Theme mode is saved";
    } catch (e) {
      _message = "Failed to save theme mode";
    }
    notifyListeners();
  }

  void getDarkModeValue() async {
    try {
      _darkMode = _service.getDarkModeValue();
      _message = "Theme mode successfully retrieved";
    } catch (e) {
      _message = "Failed to get theme mode";
    }
    notifyListeners();
  }
}
