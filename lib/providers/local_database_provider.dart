import 'package:flutter/widgets.dart';
import 'package:folkloria/data/services/local_database_service.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  final LocalDatabaseService _service;

  LocalDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

}
