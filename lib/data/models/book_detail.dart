import 'package:folkloria/data/models/category.dart';
import 'package:folkloria/data/models/customer_review.dart';
import 'package:folkloria/data/models/menu.dart';

class BookDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menu;
  final double rating;
  final List<CustomerReview> customerReviews;

  BookDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menu,
    required this.rating,
    required this.customerReviews,
  });

  factory BookDetail.fromJson(Map<String, dynamic> json) {
    return BookDetail(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      city: json["city"],
      address: json["address"],
      pictureId: json["pictureId"],
      categories: json["categories"] != null
          ? List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x)),
            )
          : <Category>[],
      menu: json["menus"] != null
          ? Menu.fromJson(json["menus"])
          : Menu(foods: [], drinks: []),
      rating: json["rating"].toDouble(),
      customerReviews: json["customerReviews"] != null
          ? List<CustomerReview>.from(
              json["customerReviews"]!.map((x) => CustomerReview.fromJson(x)),
            )
          : <CustomerReview>[],
    );
  }
}
