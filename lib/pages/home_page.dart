import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frvb/widgets/live_match_card.dart';
import 'package:frvb/widgets/competitionWidget.dart';
import 'package:frvb/widgets/match_card.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/pages/matches_page.dart';
import 'package:frvb/model/team.dart';
import 'package:frvb/model/match.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 32, right: 14),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/frvblogo.jpg"),
                  ),
                  RichText(
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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      CupertinoIcons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: competitions
                      .map(
                        (e) => InkWell(
                            onTap: () => setState(() {
                                  _selectedCompetition = e.name;
                                }),
                            child: CompetitionWidget(
                                image: e.images,
                                name: e.name,
                                isSelected: e.name == _selectedCompetition)),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
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
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LiveMatchCard(
                                width: width,
                                heigth: heigth,
                                homeTeam: kirehe,
                                awayTeam: aprvc,
                              ),
                              LiveMatchCard(
                                width: width,
                                heigth: heigth,
                                homeTeam: gsob,
                                awayTeam: kirehe,
                              ),
                            ]),
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
                                  builder: (context) => const MatchesPage()));
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
                      MatchCard(match: match1),
                      MatchCard(match: match2),
                      MatchCard(match: match3),
                      MatchCard(match: match4),
                      MatchCard(match: match5),
                      /*MatchCard(
                        match: Match(_homeTeam, _awayTeam, _time),
                      ),
                      MatchCard(match: Match(kvc, gisagara, DateTime.now())),
                      MatchCard(match: c),*/

                      /*MatchCard(match:Match(awayTeam: gsob, homeTeam: aprvc,time:DateTime.now())),
                      MatchCard(match:Match(awayTeam: aprvc, homeTeam: reg,time:DateTime.now())),
                      MatchCard(match:Match(awayTeam: reg,homeTeam: kvc,,time:DateTime.now()))*/
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
