import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/data/models/menu_detail/menu_detail_model.dart';
import 'package:food_app/data/repositories/menu_impl.dart';
import 'package:food_app/data/services/services.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/domain/entities/menu_detail.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/dio_api_mock.dart';

void main() {
  final DioApi dioApi = MockDioApi();
  late MenuRepoImpl repo;

  setUp(() {
    repo = MenuRepoImpl(dioApi: dioApi);
  });

  List<Map<String, dynamic>> meals = [
    {
      'strMeal': 'Beef and Mustard Pie',
      'strMealThumb':
          'https:\/\/www.themealdb.com\/images\/media\/meals\/sytuqu1511553755.jpg',
      'idMeal': '52874'
    },
  ];

  Future<Response<Map<String, dynamic>>> menus = Future(
    () => Response(requestOptions: RequestOptions(path: ''), data: {
      "meals": meals,
    }),
  );

  List<Menu> expectedMenus = List<Map<String, dynamic>>.from(meals)
      .map((json) => MenuModel.fromJson(json).toEntity())
      .toList();

  List<Map<String, dynamic>> mealDetails = [
    {
      "idMeal": "52772",
      "strMeal": "Teriyaki Chicken Casserole",
      "strDrinkAlternate": null,
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350\u00b0 F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, \u00bd cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!",
      "strMealThumb":
          "https:\/\/www.themealdb.com\/images\/media\/meals\/wvpsxx1468256321.jpg",
      "strTags": "Meat,Casserole",
      "strYoutube": "https:\/\/www.youtube.com\/watch?v=4aZr5hZXP_s",
      "strIngredient1": "soy sauce",
      "strIngredient2": "water",
      "strIngredient3": "brown sugar",
      "strIngredient4": "ground ginger",
      "strIngredient5": "minced garlic",
      "strIngredient6": "cornstarch",
      "strIngredient7": "chicken breasts",
      "strIngredient8": "stir-fry vegetables",
      "strIngredient9": "brown rice",
      "strIngredient10": "",
      "strIngredient11": "",
      "strIngredient12": "",
      "strIngredient13": "",
      "strIngredient14": "",
      "strIngredient15": "",
      "strIngredient16": null,
      "strIngredient17": null,
      "strIngredient18": null,
      "strIngredient19": null,
      "strIngredient20": null,
      "strMeasure1": "3\/4 cup",
      "strMeasure2": "1\/2 cup",
      "strMeasure3": "1\/4 cup",
      "strMeasure4": "1\/2 teaspoon",
      "strMeasure5": "1\/2 teaspoon",
      "strMeasure6": "4 Tablespoons",
      "strMeasure7": "2",
      "strMeasure8": "1 (12 oz.)",
      "strMeasure9": "3 cups",
      "strMeasure10": "",
      "strMeasure11": "",
      "strMeasure12": "",
      "strMeasure13": "",
      "strMeasure14": "",
      "strMeasure15": "",
      "strMeasure16": null,
      "strMeasure17": null,
      "strMeasure18": null,
      "strMeasure19": null,
      "strMeasure20": null,
      "strSource": null,
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }
  ];

  Future<Response<Map<String, dynamic>>> menuDetails = Future(
    () => Response(requestOptions: RequestOptions(path: ''), data: {
      "meals": mealDetails,
    }),
  );

  MenuDetail expectedDetail = List<Map<String, dynamic>>.from(mealDetails)
      .map((json) => MenuDetailModel.fromJson(json).toEntity())
      .toList()[0];

  test("Getting menus", () async {
    when(() => dioApi.getApi(url: "/v1/1/filter.php?c=Beef"))
        .thenAnswer((_) => menus);

    // act
    final result = await repo.getMenus("Beef");

    for (int i = 0; i < result.length; i++) {
      expect(result[i].id, expectedMenus[i].id);
      expect(result[i].name, expectedMenus[i].name);
      expect(result[i].thumbnail, expectedMenus[i].thumbnail);
    }
  });

  test("Getting menu detail", () async {
    when(() => dioApi.getApi(url: "/v1/1/lookup.php?i=1"))
        .thenAnswer((_) => menuDetails);
    final result = await repo.getMenu("1");

    expect(result.id, expectedDetail.id);
    expect(result.area, expectedDetail.area);
    expect(result.category, expectedDetail.category);
    expect(result.drinkAlternate, expectedDetail.drinkAlternate);
    expect(result.instructions, expectedDetail.instructions);
    expect(result.name, expectedDetail.name);
    expect(result.tags, expectedDetail.tags);
    expect(result.thumbnail, expectedDetail.thumbnail);
    expect(result.youtube, expectedDetail.youtube);
  });
}
