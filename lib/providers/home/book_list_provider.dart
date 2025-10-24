import 'package:flutter/widgets.dart';
import 'package:folkloria/data/services/api_service.dart';
import 'package:folkloria/common/static/book_list_result_state.dart';
import 'package:folkloria/data/models/book.dart';

class BookListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  BookListProvider(this._apiServices);

  BookListResultState _resultState = BookListNoneState();
  List<Book> _originalBookList = [];
  String _searchQuery = '';
  List<String> _searchHistory = [];

  BookListResultState get resultState => _resultState;
  String get searchQuery => _searchQuery;
  List<String> get searchHistory => _searchHistory;

  Future<void> fetchBookList() async {
    try {
      _resultState = BookListLoadingState();
      notifyListeners();

      final result = await _apiServices.getBookList();

      if (result.error) {
        _resultState = BookListErrorState(result.message);
        notifyListeners();
      } else {
        _originalBookList = result.book;
        _resultState = BookListLoadedState(result.book);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = BookListErrorState(e.toString());
      notifyListeners();
    }
  }

  void searchBooks(String query) async {
    _searchQuery = query;

    // Add to search history if not empty and not already exists
    if (query.trim().isNotEmpty && !_searchHistory.contains(query.trim())) {
      _searchHistory.insert(0, query.trim());
      // Keep only last 10 searches
      if (_searchHistory.length > 10) {
        _searchHistory = _searchHistory.take(10).toList();
      }
    }

    if (query.isEmpty) {
      _resultState = BookListLoadedState(_originalBookList);
    } else {
      try {
        _resultState = BookListLoadingState();
        notifyListeners();

        final result = await _apiServices.searchBooks(query);

        if (result.error) {
          _resultState = BookListErrorState(result.message);
        } else {
          _resultState = BookListLoadedState(result.restaurants);
        }
      } catch (e) {
        _resultState = BookListErrorState(e.toString());
      }
    }

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _resultState = BookListLoadedState(_originalBookList);
    notifyListeners();
  }

  void clearSearchHistory() {
    _searchHistory.clear();
    notifyListeners();
  }
}
