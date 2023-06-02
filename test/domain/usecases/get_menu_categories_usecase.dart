import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu_category/menu_category_model.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/domain/repos/menu_category.dart';
import 'package:food_app/domain/usecases/get_menu_categories_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuCategoryRepo extends Mock implements MenuCategoryRepo {}

void main() {
  late MockMenuCategoryRepo repo;
  late GetMenuCategoriesUseCase usecase;

  setUp(() {
    repo = MockMenuCategoryRepo();
    usecase = GetMenuCategoriesUseCase(repo);
  });

  List<MenuCategory> expectedCategories = List<Map<String, dynamic>>.from([
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
  ]).map((json) => MenuCategoryModel.fromJson(json).toEntity()).toList();

  Future<List<MenuCategory>> categories = Future(() => expectedCategories);

  test("Should get categories when execute", () async {
    when(() => repo.getMenuCategories()).thenAnswer((_) => categories);

    final result = await usecase.execute();

    expect(result, equals(expectedCategories));
  });
}
