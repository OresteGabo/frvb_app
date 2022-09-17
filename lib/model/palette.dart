import 'package:flutter/material.dart';

class Palette {
  final String backgroundImageLightMode;
  final String backgroundImageDarkMode;
  final Color backgroundColorLightMode;
  final Color backgroundColorDarkMode;

  Palette(
      {required this.backgroundImageLightMode,
      required this.backgroundImageDarkMode,
      required this.backgroundColorLightMode,
      required this.backgroundColorDarkMode});
  DecorationImage getDecorationImage(bool isDark) {
    return DecorationImage(
      fit: BoxFit.fitWidth,
      image: isDark
          ? AssetImage(backgroundImageDarkMode)
          : AssetImage(
              backgroundImageLightMode,
            ),
    );
  }

  Color getBackgroundColor(bool isDark) {
    return isDark ? backgroundColorDarkMode : backgroundColorLightMode;
  }
}

Palette palette1 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p1/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette2 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffD64E4E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p2/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette3 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffEA5761),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p3/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette4 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p4/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette5 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p5/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette6 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffFE9010),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p6/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette7 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff344C4C),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p7/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette8 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffC3DBFC),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p8/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette9 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff638092),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p9/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette10 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p10/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette11 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p11/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette12 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p12/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette13 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p13/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette14 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffD09E00),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p14/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette15 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffF8C700),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p15/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette16 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff0E0E18),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p16/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette17 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p17/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette18 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff2C2C2C),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p18/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette19 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff7DB9DA),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/p19/bk.jpg", //'assets/palettes/p1/bg.jpg',
);
