import 'package:food_app/domain/entities/ingredients.dart';
import 'package:food_app/domain/entities/menu_detail.dart';

class MenuDetailModel {
  String id;

  String name;

  String thumbnail;

  String? drinkAlternate;

  String category;

  String area;

  String instructions;

  String tags;

  String youtube;

  List<Ingredients> ingredients;

  MenuDetailModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.tags,
    required this.youtube,
    required this.ingredients,
  });

  factory MenuDetailModel.fromJson(Map<String, dynamic> json) {
    List<Ingredients> ingridients = [];
    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null &&
          json['strIngredient$i'].toString().isNotEmpty &&
          json['strMeasure$i'] != null &&
          json['strMeasure$i'].toString().isNotEmpty) {
        ingridients.add(
          Ingredients(
            ingredients: json['strIngredient$i'],
            measurement: json['strMeasure$i'],
          ),
        );
      }
    }

    return MenuDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      drinkAlternate: json['strDrinkAlternate'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      tags: json['strTags'],
      youtube: json['strYoutube'],
      ingredients: ingridients,
    );
  }

  MenuDetail toEntity() => MenuDetail(
        id: id,
        name: name,
        thumbnail: thumbnail,
        drinkAlternate: drinkAlternate,
        category: category,
        area: area,
        instructions: instructions,
        tags: tags,
        youtube: youtube,
        ingridients: ingredients,
      );
}
