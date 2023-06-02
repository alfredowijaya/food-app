import 'package:food_app/domain/entities/menu.dart';

class MenuCubitState {
  List<Menu> menus = [];

  MenuCubitState({
    required this.menus,
  });
}

class MenuLoading extends MenuCubitState {
  MenuLoading({required List<Menu> menus}) : super(menus: menus);
}

class MenuLoaded extends MenuCubitState {
  MenuLoaded({required List<Menu> menus}) : super(menus: menus);
}

class MenuError extends MenuCubitState {
  MenuError({required List<Menu> menus}) : super(menus: menus);
}
