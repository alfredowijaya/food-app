import 'package:flutter_dotenv/flutter_dotenv.dart';

class Envrionment {
  static load() async {
    const String environment =
        String.fromEnvironment("ENV", defaultValue: "development");
    await dotenv.load(fileName: 'lib/config/envs/$environment.env');
  }

  static String get baseUrl => dotenv.get("BASE_URL") == ""
      ? "themealdb.com/api/json"
      : dotenv.get("BASE_URL");
}
