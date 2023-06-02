import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/data/models/menu/menu_response.dart';
import 'package:food_app/data/models/menu_detail/menu_detail_response.dart';
import 'package:food_app/data/services/services.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/entities/menu_detail.dart';
import 'package:food_app/domain/repos/menu_repo.dart';

class MenuRepoImpl extends MenuRepo {
  final DioApi dioApi;

  MenuRepoImpl({required this.dioApi});

  @override
  Future<List<Menu>> getMenus(String category) async {
    final result = MenuResponse.fromJson(
      (await dioApi.getApi(url: "/v1/1/filter.php?c=$category")).data,
    );

    return List<MenuModel>.from(result.meals)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<MenuDetail> getMenu(String id) async {
    final result = MenuDetailResponse.fromJson(
      (await dioApi.getApi(url: "/v1/1/lookup.php?i=$id")).data,
    );

    return result.meal.toEntity();
  }
}
