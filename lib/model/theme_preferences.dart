import 'package:shared_preferences/shared_preferences.dart';

///this class will help us to keep track of what the user has selected before,
///and to anticipate the change
class ThemePreferences {
  static const PREF_KEY = 'pref_key';
  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY);
  }
}
