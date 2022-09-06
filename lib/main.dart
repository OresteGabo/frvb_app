import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: AppVars.isDark ? ThemeData.light() : ThemeData.dark(),
      theme: AppVars.isDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'FRVB App',
      home: const MainPage(),
    );
  }
}
