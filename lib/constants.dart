import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';

class AppVars {
  //

  /// Global variables
  static const Color lightThemeBackgroundColor =
      Color.fromARGB(255, 239, 240, 244); //copied from github mobile app
  static const Color darkThemeBackgroundColor =
      Color.fromRGBO(5, 5, 5, 1); //copied from github mobile app
  static const Color selectedColor = Color(0xffe5a457);
  static const Color teftFieldFillColor = Color.fromRGBO(214, 215, 220, 1);
  static const Color iconColor = Colors.black54;
  static const Color selectedBorderColor = Colors.orange;
  static const Color lightThemeTextColor = Colors.black;
  static const Color darkThemeTextColor = Colors.white70;
  static const Color darkThemeCardBackgroundColor =
      Color.fromRGBO(23, 24, 28, 1); //copied from github mobile app
  static const Color backgroundDebuggerColor = Colors.transparent;
  static bool showLiveMatchWidget = false;

  /// Push notification variables  (controlled by Switch buttons)
  //static bool isDark = true;
  static bool liveGamesNotificationsEnabled = false;
  static bool gamesUpdateNotificationsEnabled = false;
  static bool favoriteAthleteUpdateNotificationsEnabled = false;
  static bool favoriteCompetitionUpdateNotificationsEnabled = false;
  static bool favoriteTeamUpdateNotificationsEnabled = false;

  /// Dark and light management variables
  static const BoxShadow darkmodeShadow = BoxShadow(
    spreadRadius: 1,
    blurRadius: 10,
    blurStyle: BlurStyle.outer,
    color: darkmodeShadowColor,
  );
  static final BoxShadow lightmodeShadow = BoxShadow(
    spreadRadius: 1,
    blurRadius: 10,
    blurStyle: BlurStyle.outer,
    color: lightmodeShadowColor,
  );
  static const Color darkmodeShadowColor = Colors.black45;
  static Color lightmodeShadowColor = Colors.grey.shade400;
  //static BoxShadow boxShadow =
  //ThemeMode.dark ? darkmodeShadow : lightmodeShadow;
}
