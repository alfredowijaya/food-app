import 'package:food_app/domain/entities/menu.dart';

class MenuModel {
  String id;
  String name;
  String thumbnail;

  MenuModel({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json['idMeal'],
        name: json["strMeal"],
        thumbnail: json["strMealThumb"],
      );

  Map<String, dynamic> toJson() => {
        "idMeal": id,
        "strMeal": name,
        "strMealThumb": thumbnail,
      };

  Menu toEntity() => Menu(id: id, name: name, thumbnail: thumbnail);
}
