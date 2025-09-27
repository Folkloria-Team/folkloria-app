import 'package:folkloria/data/models/book.dart';

class BookSearchResponse {
  final bool error;
  final int founded;
  final List<Book> restaurants;
  final String message;

  BookSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
    this.message = '',
  });

  factory BookSearchResponse.fromJson(Map<String, dynamic> json) {
    return BookSearchResponse(
      error: json['error'] ?? false,
      founded: json['founded'] ?? 0,
      restaurants: json['restaurants'] != null
          ? (json['restaurants'] as List)
                .map((restaurant) => Book.fromJson(restaurant))
                .toList()
          : [],
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'founded': founded,
      'restaurants': restaurants
          .map((restaurant) => restaurant.toJson())
          .toList(),
      'message': message,
    };
  }
}
