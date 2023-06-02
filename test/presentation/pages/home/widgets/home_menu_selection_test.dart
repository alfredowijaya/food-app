import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu_category/menu_category_model.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_cubit.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_state.dart';
import 'package:food_app/presentation/pages/home/widgets/home_menu_selection.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuCategoryCubit extends MockCubit<MenuCategoryCubitState>
    implements MenuCategoryCubit {}

void main() {
  late MockMenuCategoryCubit cubit;

  setUp(() {
    cubit = MockMenuCategoryCubit();
  });

  List<MenuCategory> categories = List<Map<String, dynamic>>.from([
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

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MenuCategoryCubit>.value(
      value: cubit,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets("Display ${categories.length} number of option",
      (WidgetTester tester) async {
    when(() => cubit.state).thenReturn(
      MenuCategoryLoaded(
        categories: categories,
      ),
    );

    String? selectedMenuCategories;

    void onChanged(String? selected) {
      selectedMenuCategories = selected!;
    }

    await tester.pumpWidget(
      _makeTestableWidget(
        HomeMenuSelection(
          selectedMenuCategories: selectedMenuCategories,
          onChanged: onChanged,
        ),
      ),
    );

    final dropdown = find.byKey(
      const Key("Dropdown"),
    );

    await tester.tap(dropdown);
    await tester.pumpAndSettle();

    for (int i = 0; i < categories.length; i++) {
      expect(find.text(categories[1].category), findsNWidgets(2));
    }
  });
}
