import 'package:flutter/material.dart';
import 'package:food_app/config/themes/app_theme.dart';
import 'package:food_app/constant/routes_constant.dart';
import 'config/envs/env.dart';
import 'config/routes/routes.dart';

void main() async {
  await Envrionment.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      initialRoute: RoutesConstant.home,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
