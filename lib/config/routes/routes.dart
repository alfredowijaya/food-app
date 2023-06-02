import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constant/routes_constant.dart';
import 'package:food_app/data/repositories/menu_category_impl.dart';
import 'package:food_app/data/repositories/menu_impl.dart';
import 'package:food_app/data/services/services.dart';
import 'package:food_app/domain/usecases/get_menu_categories_usecase.dart';
import 'package:food_app/domain/usecases/get_menu_detail_usecase.dart';
import 'package:food_app/domain/usecases/get_menu_usecase.dart';
import 'package:food_app/presentation/arguments/menu_detail_page_argument.dart';
import 'package:food_app/presentation/cubits/menu/menu_cubit.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_cubit.dart';
import 'package:food_app/presentation/cubits/menu_detail/menu_detail_cubit.dart';
import 'package:food_app/presentation/pages/home/home_page.dart';
import 'package:food_app/presentation/pages/menu_detail/menu_detail_page.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.home:
        return _materialRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => MenuCategoryCubit(
                  GetMenuCategoriesUseCase(
                    MenuCategoryRepoImpl(
                      dioApi: DioApi(),
                    ),
                  ),
                ),
              ),
              BlocProvider(
                create: (_) => MenuCubit(
                  GetMenuUseCase(
                    MenuRepoImpl(
                      dioApi: DioApi(),
                    ),
                  ),
                ),
              ),
            ],
            child: const HomePage(),
          ),
        );
      case RoutesConstant.menuDetail:
        MenuDetailPageArgument arguments =
            settings.arguments as MenuDetailPageArgument;
        return _materialRoute(
          BlocProvider(
            create: (_) => MenuDetailCubit(
              GetMenuDetailUseCase(
                MenuRepoImpl(
                  dioApi: DioApi(),
                ),
              ),
            ),
            child: MenuDetailPage(
              arguments: arguments,
            ),
          ),
        );
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
