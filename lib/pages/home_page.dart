import 'package:flutter/material.dart';
import 'package:frvb/model/palette.dart';
import 'package:frvb/pages/competitions_page.dart';
import 'package:frvb/widgets/app_drawer.dart';
import 'package:frvb/widgets/live_match_card.dart';
import 'package:frvb/widgets/match_card.dart';
import 'package:frvb/pages/bookmarks_page.dart';
import 'package:frvb/pages/wallet_page.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';

const List<String> list = <String>[
  'Saved matches',
  'Favorite matches',
  'All matches'
  //'ooo'
];

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final bookMarksKey = GlobalKey();
  late PageController _pageController;
  final _palettes = [
    palette1,
    palette2,
    palette3,
    palette4,
    palette5,
    palette6,
    palette7,
    palette8,
    palette9,
    palette10,
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
  Palette _palette = palette1;
  String dropdownValue = list.first;

  /// variables that will reduce the size of the live video area to zero, in cas no stream is available

  @override
  void initState() {
    _pageController = PageController(initialPage: 2, viewportFraction: .8);
    _palette = _palettes[Math.random(0, 18)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final _controller = _pageController;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: themeProvider.isDarkMode
                ? AppVars.darkThemeTextColor
                : AppVars.iconColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: _palette.getBackgroundColor(themeProvider.isDarkMode),
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
                    //Image.asset("assets/bg_dk.png"),
                    Container(
                      //height: 140.0,
                      //width: width,

                      decoration: BoxDecoration(
                        image: _palette
                            .getDecorationImage(themeProvider.isDarkMode),
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
                            child: PageView.builder(
                              itemCount: lmcList.length,
                              physics: const PageScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: _controller,
                              itemBuilder: (BuildContext context, int index) {
                                return cardSlider(index);
                              },
                              //children: lmcList,
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
                                      child: IconButton(
                                        iconSize: 50,
                                        color: themeProvider.isDarkMode
                                            ? AppVars.darkThemeTextColor
                                            : AppVars.iconColor,
                                        icon:
                                            const Icon(Icons.bookmark_outline),
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
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "Bookmarks",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
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
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "Events",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
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
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "Pass",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Matches",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              //const Spacer(),
                              PopupMenuButton(
                                elevation: 2,
                                icon: const Icon(
                                  Icons.more_horiz,
                                ),
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry>[
                                  PopupMenuItem(
                                    child: ListTile(
                                      leading: const Icon(Icons.favorite),
                                      title: const Text('Favorite Matches'),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const CompetitionsPage(),
                                        ));
                                      },
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: ListTile(
                                      leading: const Icon(Icons.save),
                                      title: const Text('Saved Matches'),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const CompetitionsPage(),
                                        ));
                                      },
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: ListTile(
                                      subtitle: const Text(
                                        "subs",
                                        textDirection: TextDirection.rtl,
                                      ),
                                      leading: const Icon(Icons.article),
                                      title: const Text('All matches'),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const CompetitionsPage(),
                                        ));
                                      },
                                    ),
                                  ),
                                  const PopupMenuDivider(),
                                ],
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

  Widget cardSlider(int index) {
    return AnimatedBuilder(
        child: Container(
          child: lmcList[index],
        ),
        animation: _pageController,
        builder: (BuildContext context, widget) {
          return Center(
            child: widget,
          );
        });
  }
}
