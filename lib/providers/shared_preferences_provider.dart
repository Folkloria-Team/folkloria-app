import 'package:flutter/widgets.dart';
import 'package:folkloria/data/services/shared_preferences_service.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  final SharedPreferencesService _service;

  SharedPreferencesProvider(this._service);

  String _message = "";
  String get message => _message;
}
