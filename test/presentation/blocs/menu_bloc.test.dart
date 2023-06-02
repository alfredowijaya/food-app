import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/usecases/get_menu_usecase.dart';
import 'package:food_app/presentation/cubits/menu/menu_cubit.dart';
import 'package:food_app/presentation/cubits/menu/menu_state.dart';
import 'package:mocktail/mocktail.dart';

class GetMenuUseCaseMock extends Mock implements GetMenuUseCase {}

void main() {
  late GetMenuUseCaseMock usecase;
  late MenuCubit cubit;

  setUp(() {
    usecase = GetMenuUseCaseMock();
    cubit = MenuCubit(usecase);
  });

  List<Menu> expectedMenus = List<Map<String, dynamic>>.from([
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

  Future<List<Menu>> menus = Future(() => expectedMenus);
  test("Initial state should be empty", () {
    expect(cubit.state.menus, []);
  });

  test("State should be returned value of usecase", () async {
    when(() => usecase.execute("Beef")).thenAnswer((invocation) => menus);

    await cubit.fetchMenu("Beef");

    expect(cubit.state.menus, equals(expectedMenus));
  });

  test("State should be MenuCategoryError if use case throw", () async {
    when(() => usecase.execute("Beef")).thenThrow("");

    await cubit.fetchMenu("Beef");

    expect(cubit.state is MenuError, true);
  });

  test("State values not being changes when error if", () async {
    when(() => usecase.execute("Beef")).thenAnswer((invocation) => menus);

    await cubit.fetchMenu("Beef");

    expect(cubit.state.menus, equals(expectedMenus));

    when(() => usecase.execute("Beef")).thenThrow("");

    await cubit.fetchMenu("Beef");

    expect(cubit.state is MenuError, true);
    expect(cubit.state.menus, equals(expectedMenus));
  });
}
