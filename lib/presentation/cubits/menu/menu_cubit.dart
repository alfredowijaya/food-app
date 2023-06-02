import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/usecases/get_menu_usecase.dart';
import 'package:food_app/presentation/cubits/menu/menu_state.dart';

class MenuCubit extends Cubit<MenuCubitState> {
  final GetMenuUseCase _getMenuUseCase;

  MenuCubit(this._getMenuUseCase) : super(MenuCubitState(menus: []));

  Future<void> fetchMenu(String category) async {
    try {
      emit(MenuLoading(menus: state.menus));

      List<Menu> response = await _getMenuUseCase.execute(category);

      emit(MenuLoaded(menus: response));
    } catch (err) {
      emit(MenuError(menus: state.menus));
    }
  }
}
