import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static SharedPreferences prefs;

  static getPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
