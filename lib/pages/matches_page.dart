import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/pages/home_page.dart';

import '../widgets/competitionWidget.dart';
import '../widgets/match_card.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  String _selectedCompetition = competitions[0].name;

  @override
  Widget build(BuildContext context) {
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text("Matches", style: Theme.of(context).textTheme.headline4),
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
                      MatchCard(match: match1),
                      MatchCard(match: match2),
                      MatchCard(match: match3),
                      MatchCard(match: match4),
                      MatchCard(match: match5),
                      MatchCard(match: match6),
                      MatchCard(match: match7),
                      MatchCard(match: match8),
                      MatchCard(match: match9),
                      MatchCard(match: match10),
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
