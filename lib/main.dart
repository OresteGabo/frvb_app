import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/pages/main_page.dart';
import 'package:frvb/model/theme.dart';

void main() {
  runApp(const MyApp());
}

MyTheme currentTheme = MyTheme();

/*
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes of theme');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FRVB App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      themeMode: currentTheme.currentTheme(),
      home: const MainPage(),
    );
  }
}
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FRVB App',
      theme: appVars.darkMode
          ? ThemeData.dark()
          : ThemeData.light().copyWith(
              scaffoldBackgroundColor: appVars.backgroundColor,
            ),
      themeMode: currentTheme.currentTheme(),
      home: const MainPage(),
    );
  }
}
