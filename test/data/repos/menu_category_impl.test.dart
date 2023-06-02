import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu_category/menu_category_model.dart';
import 'package:food_app/data/repositories/menu_category_impl.dart';
import 'package:food_app/data/services/services.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/dio_api_mock.dart';

void main() {
  final DioApi dioApi = MockDioApi();
  late MenuCategoryRepoImpl repo;

  setUp(() {
    repo = MenuCategoryRepoImpl(dioApi: dioApi);
  });

  List<Map<String, dynamic>> meals = [
    {"strCategory": "Beef"},
    {"strCategory": "Breakfast"},
    {"strCategory": "Chicken"},
    {"strCategory": "Dessert"},
    {"strCategory": "Goat"},
    {"strCategory": "Lamb"},
    {"strCategory": "Miscellaneous"},
    {"strCategory": "Pasta"},
    {"strCategory": "Pork"},
    {"strCategory": "Seafood"},
    {"strCategory": "Side"},
    {"strCategory": "Starter"},
    {"strCategory": "Vegan"},
    {"strCategory": "Vegetarian"}
  ];

  Future<Response<Map<String, dynamic>>> categories = Future(() => Response(
      requestOptions: RequestOptions(path: ""), data: {"meals": meals}));

  List<MenuCategory> expectedCategories = List<Map<String, dynamic>>.from(meals)
      .map((json) => MenuCategoryModel.fromJson(json).toEntity())
      .toList();

  test("Getting menu categories", () async {
    when(() => dioApi.getApi(url: "/v1/1/list.php?c=list"))
        .thenAnswer((_) => categories);

    final result = await repo.getMenuCategories();

    for (int i = 0; i < result.length; i++) {
      expect(result[i].category, expectedCategories[i].category);
    }
  });
}
