import 'package:flutter/material.dart';

class appVars {
  /// Global variables
  static Color backgroundColor = Color.fromARGB(235, 246, 246, 246);
  static Color pinkColor = Color(0xffff0e80);
  static Color selectedColor = Color(0xffe5a457);
  static Color iconColors = Colors.grey;
  static Color selectedBorderColor = Colors.orange;

  /// Push notification variables
  static bool isDark = false;
  static bool liveGamesNotificationsEnabled = false;
  static bool gamesUpdateNotificationsEnaled = false;
  static bool favoriteAthleteUpdateNotificationsEnabled = false;
  static bool favoriteCompetitionUpdateNotificationsEnabled = false;
  static bool favoriteTeamUpdateNotificationsEnabled = false;

  /// Dark and light management variables
  static BoxShadow darkmodeShadow = const BoxShadow();
  static BoxShadow lightmodeShadow = const BoxShadow();
  static Color darkmodeShadowColor = Colors.black45;
  static Color lightmodeShadowColor = Colors.grey.shade400;
  static BoxShadow boxShadow = isDark ? darkmodeShadow : lightmodeShadow;

  appVars() {
    darkmodeShadow = BoxShadow(
      spreadRadius: 2,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
      color: darkmodeShadowColor,
    );
    lightmodeShadow = BoxShadow(
      spreadRadius: 2,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
      color: lightmodeShadowColor,
    );
  }
}
