import 'package:shared_preferences/shared_preferences.dart';
import 'package:folkloria/data/models/dark_mode.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String _keyDarkMode = "MY_DARK_MODE";

  Future<void> saveDarkModeValue(DarkMode darkMode) async {
    try {
      await _preferences.setBool(_keyDarkMode, darkMode.darkModeEnable);
    } catch (e) {
      throw Exception("Shared preferences cannot save the setting value.");
    }
  }

  DarkMode getDarkModeValue() {
    return DarkMode(darkModeEnable: _preferences.getBool(_keyDarkMode) ?? true);
  }
}
