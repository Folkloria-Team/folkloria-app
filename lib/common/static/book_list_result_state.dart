// import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/data/models/story.dart';

sealed class BookListResultState {}

class BookListNoneState extends BookListResultState {}

class BookListLoadingState extends BookListResultState {}

class BookListErrorState extends BookListResultState {
  final String error;

  BookListErrorState(this.error);
}

class BookListLoadedState extends BookListResultState {
  final List<Story> data;

  BookListLoadedState(this.data);
}
