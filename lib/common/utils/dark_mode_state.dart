enum DarkModeState {
  enable,
  disable;

  bool get isEnable => this == DarkModeState.enable;
}

extension BoolExtension on bool {
  DarkModeState get isEnable =>
      this == true ? DarkModeState.enable : DarkModeState.disable;
}
