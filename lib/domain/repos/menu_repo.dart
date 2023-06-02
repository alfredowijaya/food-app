import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/entities/menu_detail.dart';

abstract class MenuRepo {
  Future<List<Menu>> getMenus(String category);

  Future<MenuDetail> getMenu(String id);
}
