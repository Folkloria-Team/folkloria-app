import 'package:folkloria/data/models/book_detail.dart';

class BookDetailResponse {
  final bool error;
  final String message;
  final BookDetail bookDetail;

  BookDetailResponse({
    required this.error,
    required this.message,
    required this.bookDetail,
  });

  factory BookDetailResponse.fromJson(Map<String, dynamic> json) {
    return BookDetailResponse(
      error: json["error"],
      message: json["message"],
      bookDetail: BookDetail.fromJson(json["restaurant"]),
    );
  }
}
