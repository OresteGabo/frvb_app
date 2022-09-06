import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frvb/widgets/live_match_card.dart';
import 'package:frvb/widgets/match_card.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/pages/matches_page.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCompetition = competitions[0].name;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;

    final _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppVars.backgroundColor,
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/frvblogo.jpg"),
        ),
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
                      Container(
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
                      Center(
                        child: Container(
                          width: width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Image.asset("assets/booking.png"),
                                    height: 70,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          blurStyle: BlurStyle.outer,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
                              Column(
                                children: [
                                  Container(
                                    child: Image.asset("assets/event.png"),
                                    //width: 70,
                                    height: 70,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          blurStyle: BlurStyle.outer,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
                              Column(
                                children: [
                                  Container(
                                    child:
                                        Image.asset("assets/qr-code-scan.png"),
                                    height: 70,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          blurStyle: BlurStyle.outer,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
                                          child: MatchesPage(),
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
