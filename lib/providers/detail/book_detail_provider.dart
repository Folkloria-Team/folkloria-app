import 'package:flutter/material.dart';
import 'package:folkloria/data/services/api_service.dart';
import 'package:folkloria/common/static/book_detail_result_state.dart';

class BookDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  BookDetailProvider(this._apiServices);

  BookDetailResultState _resultState = BookDetailNoneState();

  BookDetailResultState get resultState => _resultState;

  Future<void> fetchBookDetail(String id) async {
    try {
      _resultState = BookDetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getStoryDetail(id);

      if (result.message.isEmpty) {
        _resultState = BookDetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = BookDetailLoadedState(result.data);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = BookDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
