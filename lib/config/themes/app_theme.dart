import 'package:flutter/material.dart';
import 'package:food_app/constant/fonts_constant.dart';
import 'package:food_app/utils/helper.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: Helper.hexCodeToColor("#129575"),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: FontsConstant.poppins,
          color: Colors.black,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
