import 'package:flutter/widgets.dart';
import 'package:folkloria/common/utils/dark_mode_state.dart';

class DarkModeStateProvider extends ChangeNotifier {
  DarkModeState _darkModeState = DarkModeState.enable;

  DarkModeState get darkModeState => _darkModeState;

  set darkModeState(DarkModeState value) {
    _darkModeState = value;
    notifyListeners();
  }
}
