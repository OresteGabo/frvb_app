import 'package:flutter/material.dart';
import 'package:frvb/model/match.dart';

class Palette {
  final String backgroundImageLightMode;
  final String backgroundImageDarkMode;
  final Color backgroundColorLightMode;
  final Color backgroundColorDarkMode;
  final bool bgColorIsLight;
  final Color alternativeBgColor;

  Palette(
      {this.backgroundImageLightMode = "assets/palettes/bk_1.jpg",
      this.backgroundImageDarkMode = "assets/bg_dk.png",
      this.backgroundColorLightMode = const Color.fromRGBO(255, 217, 198, 1),
      this.backgroundColorDarkMode = const Color.fromRGBO(0, 0, 0, 1),
      this.bgColorIsLight = false,
      this.alternativeBgColor = Colors.grey});

  static int randomPaletteIndex() {
    return Math.random(0, _palettes.length - 1);
  }

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

  static Palette getPalette() {
    return _palettes[randomPaletteIndex()];
  }

  static final List<Palette> _palettes = [
    palette1,
    palette2,
    palette3,
    palette6,
    palette7,
    palette8,
    palette9,
    palette11,
    palette12,
    palette13,
    palette14,
    palette15,
    palette16,
    palette17,
    palette18,
    palette19,
  ];
}

Palette palette1 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_1.jpg",
);
Palette palette2 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  bgColorIsLight: true,
  backgroundColorLightMode: const Color(0xfffae9eb),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_2.jpg",
);
Palette palette3 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 245, 220, 1),
  bgColorIsLight: true,
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_3.jpg",
);
/*Palette palette4 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_4.jpg",
);
Palette palette5 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_5.jpg",
);*/
Palette palette6 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffFE9010),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_6.jpg",
);
Palette palette7 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff344C4C),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_7.jpg",
);
Palette palette8 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xffC3DBFC),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_8.jpg",
);
Palette palette9 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff638092),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_9.jpg",
);
/*
Palette palette10 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_10.jpg",
);*/
Palette palette11 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color.fromRGBO(255, 217, 198, 1),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_11.jpg",
);
Palette palette12 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode: "assets/palettes/bk_12.jpg",
);
Palette palette13 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xff64675E),
  backgroundImageDarkMode: "assets/bg_dk.png",
  backgroundImageLightMode:
      "assets/palettes/bk_13.jpg", //'assets/palettes/p1/bg.jpg',
);
Palette palette14 = Palette(
  backgroundColorDarkMode: const Color.fromRGBO(0, 0, 0, 1),
  backgroundColorLightMode: const Color(0xb3d09e00),
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
  backgroundColorLightMode: const Color.fromRGBO(222, 222, 222, 1),
  bgColorIsLight: true,
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
