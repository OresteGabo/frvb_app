import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/pages/home_page.dart';
import 'package:frvb/constants.dart';
import 'package:badges/badges.dart';
import 'package:frvb/pages/main_page.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          color: Colors.green,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(
            Icons.home_rounded,
            color: Colors.grey,
          ),
        ),
        title: Text("Matches", style: Theme.of(context).textTheme.headline6),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            tooltip: 'Sort matches according to your favorite teams',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'This button will help us to sort out from bookmarked teams only')));
            },
          ),
          //Icons.circle_notifications_rounded,
          IconButton(
            icon: Badge(
              badgeContent: const Text(
                "9",
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.circle_notifications_rounded),
            ),
            tooltip: 'Show Snackbar',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 32, right: 14),
          child: Column(
            children: [
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
