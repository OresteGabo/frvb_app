import 'package:flutter/material.dart';

class AppVars {
  /// Global variables
  static const Color backgroundColor = Color.fromARGB(235, 246, 246, 246);
  static const Color pinkColor = Color(0xffff0e80);
  static const Color selectedColor = Color(0xffe5a457);
  static const Color iconColors = Colors.grey;
  static const Color selectedBorderColor = Colors.orange;
  static const Color lightThemeTextColor = Colors.black54;
  static const Color darkThemeTextColor = Colors.white70;

  /// Push notification variables  (controlled by Switch buttons)
  static bool isDark = false;
  static bool liveGamesNotificationsEnabled = false;
  static bool gamesUpdateNotificationsEnaled = false;
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
  static BoxShadow boxShadow = isDark ? darkmodeShadow : lightmodeShadow;
}
