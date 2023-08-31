import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalStorage {
  final String themeKey = "themekey";
  setTheme(bool value) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(themeKey, value);
  }

  Future<bool> getTheme() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(themeKey) ?? false;
  }
}
