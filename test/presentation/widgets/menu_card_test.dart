import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/data/models/menu/menu_model.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/presentation/widgets/menu_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  Menu menu = MenuModel.fromJson(
    {
      'strMeal': 'Beef and Mustard Pie',
      'strMealThumb':
          'https:\/\/www.themealdb.com\/images\/media\/meals\/sytuqu1511553755.jpg',
      'idMeal': '52874'
    },
  ).toEntity();

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets("MenuCard should display thumbnail and name",
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        _makeTestableWidget(
          Menucard(
            menu: menu,
          ),
        ),
      );
    });

    expect(find.byType(Image), findsOneWidget);
    expect(find.text(menu.name), findsOneWidget);
  });
}
