import 'dart:ui';

class Helper {
  static Color hexCodeToColor(String hex) {
    try {
      return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (err) {
      return const Color.fromRGBO(0, 0, 0, 1);
    }
  }
}
