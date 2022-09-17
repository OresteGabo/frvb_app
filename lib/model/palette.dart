import 'package:flutter/material.dart';

class Palette {
  final String backgroundImageLightMode;
  final String backgroundImageDarkMode;
  final Color backgroundColorLightMode;
  final Color backgroundColorDarkMode;

  Palette({
    this.backgroundImageLightMode = "assets/palettes/bk_1.jpg",
    this.backgroundImageDarkMode = "assets/bg_dk.png",
    this.backgroundColorLightMode = const Color.fromRGBO(255, 217, 198, 1),
    this.backgroundColorDarkMode = const Color.fromRGBO(0, 0, 0, 1),
  });
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
      "assets/palettes/bk_1.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette2 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffD64E4E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_2.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette3 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffEA5761),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_3.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette4 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_4.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette5 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_5.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette6 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffFE9010),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_6.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette7 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff344C4C),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_7.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette8 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffC3DBFC),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_8.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette9 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff638092),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_9.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette10 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_10.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette11 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_11.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette12 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_12.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette13 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_13.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette14 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffD09E00),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_14.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette15 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffF8C700),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_15.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette16 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff0E0E18),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_16.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette17 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_17.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette18 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff2C2C2C),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_18.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette19 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff7DB9DA),
  backgroundImageDarkMode: "assets/bg_dk.png", //'assets/palettes/p1/bg_dk.png',
  backgroundImageLightMode:
      "assets/palettes/bk_19.jpg", //'assets/palettes/p1/bg.jpg',
);
