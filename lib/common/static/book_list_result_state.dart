import 'package:folkloria/data/models/book.dart';

sealed class BookListResultState {}

class BookListNoneState extends BookListResultState {}

class BookListLoadingState extends BookListResultState {}

class BookListErrorState extends BookListResultState {
  final String error;

  BookListErrorState(this.error);
}

class BookListLoadedState extends BookListResultState {
  final List<Book> data;

  BookListLoadedState(this.data);
}
