import 'package:food_app/data/models/menu/menu_model.dart';

class MenuResponse {
  final List<MenuModel> meals;

  MenuResponse({
    required this.meals,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
        meals: List<Map<String, dynamic>>.from((json['meals'] ?? []))
            .map(
              (json) => MenuModel.fromJson(json),
            )
            .toList(),
      );
}
