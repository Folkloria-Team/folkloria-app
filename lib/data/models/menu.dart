import 'package:folkloria/data/models/menu_item.dart';

class Menu {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      foods: json["foods"] != null
          ? List<MenuItem>.from(json["foods"]!.map((x) => MenuItem.fromJson(x)))
          : <MenuItem>[],
      drinks: json["drinks"] != null
          ? List<MenuItem>.from(
              json["drinks"]!.map((x) => MenuItem.fromJson(x)),
            )
          : <MenuItem>[],
    );
  }
}
