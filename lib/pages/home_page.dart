import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/widgets/live_match_card.dart';
import 'package:frvb/widgets/match_card.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/pages/matches_page.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _selectedCompetition = competitions[0].name;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final _controller = PageController();
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: themeProvider.isDarkMode
                ? AppVars.darkThemeTextColor
                : AppVars.iconColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeProvider.isDarkMode
            ? AppVars.darkThemeBackgroundColor
            : AppVars.lightThemeBackgroundColor,
        /*leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/frvblogo.jpg"),
        ),*/
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                children: [
                  const TextSpan(text: "FR"),
                  TextSpan(
                    text: "VB",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ])),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 10, right: 14),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Live Match",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        //padding: const EdgeInsets.all(16.0),
                        height: 250,

                        child: PageView(
                          physics: const PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          children: lmcList,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _controller,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: Color(0xff493f5d),
                          ),
                          count: lmcList.length,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      /// Three elevated buttons (Bookings, Events and Pass)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: themeProvider.isDarkMode
                                      ? AppVars.darkmodeShadowColor
                                      : AppVars.lightmodeShadowColor,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: themeProvider.isDarkMode
                                          ? Colors.grey.shade700
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    //padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.only(
                                        left: 0, top: 8, bottom: 8, right: 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        /// This background has to be modified later, to fit the darkmode (should be similar to the container color)
                                        backgroundColor:
                                            themeProvider.isDarkMode
                                                ? Colors.grey.shade700
                                                : Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        final snackBar = SnackBar(
                                          content: const Text(
                                              'This button will show u all your bookings'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );

                                        // Find the ScaffoldMessenger in the widget tree
                                        // and use it to show a SnackBar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Image.asset("assets/booking.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Bookings",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: themeProvider.isDarkMode
                                      ? AppVars.darkmodeShadowColor
                                      : AppVars.lightmodeShadowColor,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: themeProvider.isDarkMode
                                          ? Colors.grey.shade700
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    //padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.only(
                                        left: 0, top: 8, bottom: 8, right: 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        /// This background has to be modified later, to fit the darkmode (should be similar to the container color)
                                        backgroundColor:
                                            themeProvider.isDarkMode
                                                ? Colors.grey.shade700
                                                : Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        final snackBar = SnackBar(
                                          content: const Text(
                                              'This button will show u all your bookings'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );

                                        // Find the ScaffoldMessenger in the widget tree
                                        // and use it to show a SnackBar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Image.asset("assets/event.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Events",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: themeProvider.isDarkMode
                                      ? AppVars.darkmodeShadowColor
                                      : AppVars.lightmodeShadowColor,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: themeProvider.isDarkMode
                                          ? Colors.grey.shade700
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    //padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.only(
                                        left: 0, top: 8, bottom: 8, right: 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        /// This background has to be modified later, to fit the darkmode (should be similar to the container color)
                                        backgroundColor:
                                            themeProvider.isDarkMode
                                                ? Colors.grey.shade700
                                                : Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        final snackBar = SnackBar(
                                          content: const Text(
                                              'This button will show u all your bookings'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );

                                        // Find the ScaffoldMessenger in the widget tree
                                        // and use it to show a SnackBar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Image.asset("assets/qr-code.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Pass",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            "Matches",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  // builder: (context) => const MatchesPage()));
                                  builder: (context) => MaterialApp(
                                        home: DefaultTabController(
                                          length: competitions.length,
                                          child: const MatchesPage(),
                                        ),
                                      )));
                            },
                            child: const Text(
                              "See All",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MatchCard(
                        match: match1,
                        isSelected: false,
                      ),
                      MatchCard(
                        match: match2,
                        isSelected: false,
                      ),
                      MatchCard(
                        match: match3,
                        isSelected: false,
                      ),
                      MatchCard(
                        match: match4,
                        isSelected: false,
                      ),
                      MatchCard(
                        match: match5,
                        isSelected: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
