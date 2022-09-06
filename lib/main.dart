import 'package:flutter/material.dart';
import 'package:frvb/pages/main_page.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            //theme: AppVars.isDark ? ThemeData.dark() : ThemeData.light(),
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'FRVB App',
            home: const MainPage(),
          );
        });
  }
}
