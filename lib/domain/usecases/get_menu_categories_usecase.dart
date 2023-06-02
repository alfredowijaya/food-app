import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/domain/repos/menu_category.dart';

class GetMenuCategoriesUseCase {
  final MenuCategoryRepo _menuCategoryRepo;

  GetMenuCategoriesUseCase(this._menuCategoryRepo);

  Future<List<MenuCategory>> execute() => _menuCategoryRepo.getMenuCategories();
}
