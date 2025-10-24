// import 'package:folkloria/data/models/book_detail.dart';
import 'package:folkloria/data/models/story_detail.dart';

sealed class BookDetailResultState {}

class BookDetailNoneState extends BookDetailResultState {}

class BookDetailLoadingState extends BookDetailResultState {}

class BookDetailErrorState extends BookDetailResultState {
  final String error;

  BookDetailErrorState(this.error);
}

class BookDetailLoadedState extends BookDetailResultState {
  final StoryDetail data;

  BookDetailLoadedState(this.data);
}
