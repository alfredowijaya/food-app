import 'package:food_app/domain/entities/menu_category.dart';

abstract class MenuCategoryRepo {
  Future<List<MenuCategory>> getMenuCategories();
}
