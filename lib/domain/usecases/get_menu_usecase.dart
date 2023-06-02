import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/repos/menu_repo.dart';

class GetMenuUseCase {
  final MenuRepo _menuRepo;

  GetMenuUseCase(this._menuRepo);

  Future<List<Menu>> execute(String category) => _menuRepo.getMenus(category);
}
