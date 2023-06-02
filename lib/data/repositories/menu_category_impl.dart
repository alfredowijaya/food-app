import 'package:food_app/data/models/menu_category/menu_category_model.dart';
import 'package:food_app/data/models/menu_category/menu_category_response.dart';
import 'package:food_app/data/services/services.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/domain/repos/menu_category.dart';

class MenuCategoryRepoImpl implements MenuCategoryRepo {
  final DioApi dioApi;

  MenuCategoryRepoImpl({required this.dioApi});

  @override
  Future<List<MenuCategory>> getMenuCategories() async {
    final result = MenuCategoryResponse.fromJson(
      (await dioApi.getApi(url: "/v1/1/list.php?c=list")).data,
    );

    return List<MenuCategoryModel>.from(result.meals)
        .map((model) => model.toEntity())
        .toList();
  }
}
