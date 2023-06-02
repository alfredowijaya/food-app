import 'package:food_app/domain/entities/menu_category.dart';

class MenuCategoryCubitState {
  List<MenuCategory> categories = [];

  MenuCategoryCubitState({
    required this.categories,
  });
}

class MenuCategoryLoading extends MenuCategoryCubitState {
  MenuCategoryLoading({required List<MenuCategory> categories})
      : super(categories: categories);
}

class MenuCategoryLoaded extends MenuCategoryCubitState {
  MenuCategoryLoaded({required List<MenuCategory> categories})
      : super(categories: categories);
}

class MenuCategoryError extends MenuCategoryCubitState {
  MenuCategoryError({required List<MenuCategory> categories})
      : super(categories: categories);
}
