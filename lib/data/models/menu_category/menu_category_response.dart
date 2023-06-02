import 'package:food_app/data/models/menu_category/menu_category_model.dart';

class MenuCategoryResponse {
  final List<MenuCategoryModel> meals;

  MenuCategoryResponse({
    required this.meals,
  });

  factory MenuCategoryResponse.fromJson(Map<String, dynamic> json) =>
      MenuCategoryResponse(
        meals: List<Map<String, dynamic>>.from((json['meals'] ?? []))
            .map(
              (json) => MenuCategoryModel.fromJson(json),
            )
            .toList(),
      );
}
