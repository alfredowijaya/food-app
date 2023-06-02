import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/menu_detail.dart';
import 'package:food_app/domain/usecases/get_menu_detail_usecase.dart';
import 'package:food_app/presentation/cubits/menu_detail/menu_detail_state.dart';

class MenuDetailCubit extends Cubit<MenuDetailCubitState> {
  final GetMenuDetailUseCase _getMenuDetailUseCase;

  MenuDetailCubit(this._getMenuDetailUseCase)
      : super(MenuDetailCubitState(detail: null));

  Future<void> fetchMenuDetail(String id) async {
    try {
      emit(MenuDetailLoading(detail: state.detail));

      MenuDetail response = await _getMenuDetailUseCase.execute(id);

      emit(MenuDetailLoaded(detail: response));
    } catch (err) {
      emit(MenuDetailError(detail: state.detail));
    }
  }
}
