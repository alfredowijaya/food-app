import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu_category/menu_category_model.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/domain/usecases/get_menu_categories_usecase.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_cubit.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_state.dart';
import 'package:mocktail/mocktail.dart';

class GetMenuCategoriesUseCaseMock extends Mock
    implements GetMenuCategoriesUseCase {}

void main() {
  late GetMenuCategoriesUseCase usecase;
  late MenuCategoryCubit cubit;

  setUp(() {
    usecase = GetMenuCategoriesUseCaseMock();
    cubit = MenuCategoryCubit(usecase);
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

  Future<List<MenuCategory>> menus = Future(() => expectedCategories);

  test("Initial state should be empty", () {
    expect(cubit.state.categories, equals([]));
  });

  test("State should be returned value of usecase", () async {
    when(() => usecase.execute()).thenAnswer((invocation) => menus);

    await cubit.fetchMenuCategories();

    expect(cubit.state.categories, equals(expectedCategories));
  });

  test("State should be MenuCategoryError", () async {
    when(() => usecase.execute()).thenThrow("");

    await cubit.fetchMenuCategories();

    expect(cubit.state is MenuCategoryError, true);
  });

  test("State values not being changes when error", () async {
    when(() => usecase.execute()).thenAnswer((invocation) => menus);

    await cubit.fetchMenuCategories();

    expect(cubit.state.categories, equals(expectedCategories));

    when(() => usecase.execute()).thenThrow("");

    await cubit.fetchMenuCategories();

    expect(cubit.state is MenuCategoryError, true);
    expect(cubit.state.categories, equals(expectedCategories));
  });
}
