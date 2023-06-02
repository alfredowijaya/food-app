import 'package:food_app/domain/entities/ingredients.dart';
import 'package:food_app/domain/entities/menu.dart';

class MenuDetail implements Menu {
  @override
  String id;

  @override
  String name;

  @override
  String thumbnail;

  String? drinkAlternate;

  String category;

  String area;

  String instructions;

  String tags;

  String youtube;

  List<Ingredients> ingridients;

  MenuDetail({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.drinkAlternate,
    required this.category,
    required this.area,
    required this.instructions,
    required this.tags,
    required this.youtube,
    required this.ingridients,
  });
}
