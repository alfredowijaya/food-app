import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/repos/menu_repo.dart';
import 'package:food_app/domain/usecases/get_menu_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuRepo extends Mock implements MenuRepo {}

void main() {
  late MockMenuRepo repo;
  late GetMenuUseCase usecase;

  setUp(() {
    repo = MockMenuRepo();
    usecase = GetMenuUseCase(repo);
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

  test("Should menus when execute", () async {
    when(() => repo.getMenus("Beef")).thenAnswer((_) => menus);

    final result = await usecase.execute("Beef");

    expect(result, equals(expectedMenus));
  });
}
