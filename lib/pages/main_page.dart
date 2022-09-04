import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frvb/pages/calendar_page.dart';
import 'package:frvb/pages/home_page.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/pages/account_page.dart';
import 'package:frvb/pages/settings.dart';
import 'package:frvb/pages/stats_page.dart';

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
    /*return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          activeColor: pinkColor,
          border: const Border(),
          iconSize: 35,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return _children[_currentIndex];
            },
          );
        });*/
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: _children[_currentIndex],
    );
  }

  NavigationBar navigationBar() {
    return NavigationBar(
      selectedIndex: _currentIndex,
      backgroundColor: backgroundColor,
      destinations: const [
        NavigationDestination(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.calendar_month), label: 'Calendar'),
        NavigationDestination(
            icon: Icon(Icons.bar_chart_rounded), label: 'Statistics'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
      ],
      onDestinationSelected: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  BottomNavigationBar bottomNavigationBar() {
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
      unselectedItemColor: iconColors,
      iconSize: 27,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
