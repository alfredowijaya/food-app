import 'package:food_app/domain/entities/menu_detail.dart';
import 'package:food_app/domain/repos/menu_repo.dart';

class GetMenuDetailUseCase {
  final MenuRepo _menuRepo;

  GetMenuDetailUseCase(this._menuRepo);

  Future<MenuDetail> execute(String id) => _menuRepo.getMenu(id);
}
