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
