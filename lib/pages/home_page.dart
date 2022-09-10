import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/widgets/app_drawer.dart';
import 'package:frvb/widgets/live_match_card.dart';
import 'package:frvb/widgets/match_card.dart';
import 'package:frvb/pages/matches_page.dart';
import 'package:frvb/pages/bookmarks_page.dart';
import 'package:frvb/pages/wallet_page.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final bookMarksKey = GlobalKey();
  late AnimationController _animationController;

  /// variables that will reduce the size of the live video area to zero, in cas no stream is available

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([
        bookMarksKey,
      ]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final _controller = PageController();
    void goTo(Widget widget) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MatchesPage()));
    }

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: themeProvider.isDarkMode
                ? AppVars.darkThemeTextColor
                : AppVars.iconColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeProvider.isDarkMode
            ? AppVars.darkThemeBackgroundColor
            : const Color.fromRGBO(255, 217, 198, 1),
        flexibleSpace: Container(),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: [
              TextSpan(
                text: "FRVB",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: themeProvider.isDarkMode
                              ? const AssetImage("assets/bg_dk.png")
                              : const AssetImage("assets/bg.jpg"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),

                          Container(
                            height: lmcList.isNotEmpty &&
                                    AppVars.showLiveMatchWidget
                                ? 210
                                : 0,
                            color: AppVars.backgroundDebuggerColor,
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
                              effect: ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: lmcList.isNotEmpty &&
                                        AppVars.showLiveMatchWidget
                                    ? 10
                                    : 0,
                                activeDotColor: const Color(0xff493f5d),
                              ),
                              count: lmcList.length,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          /// Three elevated buttons (Bookmarks, Events and Pass)
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Showcase(
                                        key: bookMarksKey,
                                        description:
                                            "This will show all your likes, saves and bookmarks",
                                        child: IconButton(
                                          iconSize: 50,
                                          color: themeProvider.isDarkMode
                                              ? AppVars.darkThemeTextColor
                                              : AppVars.iconColor,
                                          icon: const Icon(
                                              Icons.bookmark_outline),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const BookmarkPage(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Bookmarks",
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
                                      child: IconButton(
                                        iconSize: 50,
                                        color: themeProvider.isDarkMode
                                            ? AppVars.darkThemeTextColor
                                            : AppVars.iconColor,
                                        icon: const Icon(
                                          Icons.calendar_month,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EventsPage()));
                                        },
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
                                      child: IconButton(
                                        iconSize: 50,
                                        color: themeProvider.isDarkMode
                                            ? AppVars.darkThemeTextColor
                                            : AppVars.iconColor,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WalletPage()));
                                        },
                                        icon: const Icon(
                                          Icons.qr_code_2,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14, top: 10, right: 14),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Matches",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const MatchesPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          MatchCard(
                            match: match1,
                          ),
                          MatchCard(
                            match: match2,
                          ),
                          MatchCard(
                            match: match3,
                          ),
                          MatchCard(
                            match: match4,
                          ),
                          MatchCard(
                            match: match5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
