import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/menu_category.dart';
import 'package:food_app/domain/usecases/get_menu_categories_usecase.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_state.dart';

class MenuCategoryCubit extends Cubit<MenuCategoryCubitState> {
  final GetMenuCategoriesUseCase _getMenuCategoriesUseCase;

  MenuCategoryCubit(this._getMenuCategoriesUseCase)
      : super(MenuCategoryCubitState(categories: []));

  Future<void> fetchMenuCategories() async {
    try {
      emit(MenuCategoryLoading(categories: state.categories));

      List<MenuCategory> response = await _getMenuCategoriesUseCase.execute();

      emit(MenuCategoryLoaded(categories: response));
    } catch (err) {
      emit(MenuCategoryError(categories: state.categories));
    }
  }
}
