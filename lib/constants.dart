import 'package:flutter/material.dart';

class appVars {
  static Color backgroundColor = Color.fromARGB(235, 246, 246, 246);
//Color backgroundColor = Colors.grey[300];
//const backgroundColor = Colors.grey[300];
  static Color pinkColor = Color(0xffff0e80);
  static Color selectedColor = Color(0xffe5a457);
  static Color iconColors = Colors.grey;
  static Color selectedBorderColor = Colors.orange;
  static bool isDark = false;
  static BoxShadow darkmodeShadow = const BoxShadow();
  static BoxShadow lightmodeShadow = const BoxShadow();

  //appVars();

  static Color darkmodeShadowColor = Colors.black45;
  static Color lightmodeShadowColor = Colors.grey.shade400;
  static BoxShadow boxShadow = isDark
      ? BoxShadow(
          spreadRadius: 2,
          blurRadius: 10,
          blurStyle: BlurStyle.outer,
          color: appVars.darkmodeShadowColor,
        )
      : BoxShadow(
          spreadRadius: 2,
          blurRadius: 10,
          blurStyle: BlurStyle.outer,
          color: appVars.lightmodeShadowColor,
        );

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
  } //Color();

  /*appVars (){
    this.shadowColor = isDark ? Colors.black45 : Colors.grey.shade400;
    this.darkmodeShadow = BoxShadow(
      spreadRadius: 2,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
      color: shadowColor,
    );

  }*/

}
