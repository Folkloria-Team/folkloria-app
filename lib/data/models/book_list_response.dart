import 'package:folkloria/data/models/book.dart';

class BookListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Book> book;

  BookListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.book,
  });

  factory BookListResponse.fromJson(Map<String, dynamic> json) {
    return BookListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      book: json["restaurants"] != null
          ? List<Book>.from(json["restaurants"]!.map((x) => Book.fromJson(x)))
          : <Book>[],
    );
  }
}
