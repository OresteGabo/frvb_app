import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppVars.darkThemeBackgroundColor,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppVars.lightThemeBackgroundColor,
    colorScheme: const ColorScheme.light(),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color.fromRGBO(214, 215, 220, 1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color.fromRGBO(214, 215, 220, 1)),
      ),
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),

      filled: true, //<-- SEE HERE
      fillColor: Color.fromRGBO(214, 215, 220, 1), //<-- SEE HERE
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
