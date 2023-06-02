import 'package:food_app/data/models/menu_detail/menu_detail_model.dart';

class MenuDetailResponse {
  final MenuDetailModel meal;

  MenuDetailResponse({
    required this.meal,
  });

  factory MenuDetailResponse.fromJson(Map<String, dynamic> json) =>
      MenuDetailResponse(
        meal: List<Map<String, dynamic>>.from((json['meals'] ?? []))
            .map(
              (json) => MenuDetailModel.fromJson(json),
            )
            .toList()[0],
      );
}
