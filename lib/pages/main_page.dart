import 'package:flutter/material.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:frvb/pages/calendar_page.dart';
import 'package:frvb/pages/home_page.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/pages/settings.dart';
import 'package:frvb/pages/stats_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  final _children = [
    const HomePage(),
    const CalendarPage(),
    const StatsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(themeProvider),
      body: _children[_currentIndex],
    );
  }

  BottomNavigationBar bottomNavigationBar(ThemeProvider themeProvider) {
    return BottomNavigationBar(
      //backgroundColor: Colors.green,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'calendar'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_rounded,
            ),
            label: 'statist'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'account'),
      ],
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: themeProvider.isDarkMode
          ? AppVars.darkThemeTextColor
          : AppVars.iconColor,
      iconSize: 27,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
