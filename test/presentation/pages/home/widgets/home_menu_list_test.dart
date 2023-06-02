import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/presentation/cubits/menu/menu_cubit.dart';
import 'package:food_app/presentation/cubits/menu/menu_state.dart';
import 'package:food_app/presentation/pages/home/widgets/home_menu_list.dart';
import 'package:food_app/presentation/widgets/menu_card.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockMenuCubit extends MockCubit<MenuCubitState> implements MenuCubit {}

void main() {
  late MockMenuCubit cubit;

  setUp(() {
    cubit = MockMenuCubit();
  });

  List<Menu> menus = List<Map<String, dynamic>>.from([
    {
      'strMeal': 'Beef and Mustard Pie',
      'strMealThumb':
          'https:\/\/www.themealdb.com\/images\/media\/meals\/sytuqu1511553755.jpg',
      'idMeal': '52874'
    },
    {
      'strMeal': 'Beef and Oyster pie',
      'strMealThumb':
          'https:\/\/www.themealdb.com\/images\/media\/meals\/wrssvt1511556563.jpg',
      'idMeal': '52878'
    },
  ]).map((json) => MenuModel.fromJson(json).toEntity()).toList();

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MenuCubit>.value(
      value: cubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("Display ${menus.length} num of menu",
      (WidgetTester tester) async {
    when(() => cubit.state).thenReturn(MenuLoaded(menus: menus));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        _makeTestableWidget(
          const HomeMenuList(),
        ),
      );
    });

    expect(find.byType(Menucard), findsNWidgets(menus.length));
  });
}
