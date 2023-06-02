import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/presentation/pages/home/widgets/home_header.dart';

void main() {
  _pumpTestWidget(WidgetTester tester, HomeHeader widget) =>
      tester.pumpWidget(MaterialApp(
        home: Container(
          alignment: Alignment.center,
          child: widget,
        ),
      ));

  testWidgets("Display Menu Greeting Title", (WidgetTester tester) async {
    await _pumpTestWidget(tester, const HomeHeader());

    expect(find.text("Hello Aldi"), findsOneWidget);
    expect(find.text("What Are You Cooking Today?"), findsOneWidget);
  });
}
