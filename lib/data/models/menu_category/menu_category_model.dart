import 'package:food_app/domain/entities/menu_category.dart';

class MenuCategoryModel {
  final String category;

  MenuCategoryModel({
    required this.category,
  });

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      MenuCategoryModel(category: json['strCategory']);

  Map<String, dynamic> toJson() => {
        'strCategory': category,
      };

  MenuCategory toEntity() => MenuCategory(category: category);
}
