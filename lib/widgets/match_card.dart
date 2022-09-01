import 'package:flutter/material.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/model/team.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    Key? key,
    required this.match,
    required this.isSelected,
  }) : super(key: key);

  final Match match;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      //padding: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: isSelected ? Colors.orange : Colors.transparent),
        borderRadius: BorderRadius.circular(15),
        //border: match.isMyFavorite() ? Border.all(color: Colors.orange) : null,
        //boxShadow:
        //isSelected ? selectedCardBoxShadow() : unSelectedCardBoxShadow(),
      ),

      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,

        children: [
          Positioned(
            right: width / 2 + 20,
            child: Row(
              children: [
                Text(
                  match.homeTeam.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  match.homeTeam.logo,
                  width: 40,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.green,
                      iconSize: 30,
                      onPressed: () {
                        int size = favoriteMatches.length;

                        if (match.isMyFavorite()) {
                          displayAllFavorites();
                          print('Favorite matches size before removal:$size\n');

                          match.removeToMyFavorite();
                          print('Favorite matches size after removal:$size\n');
                        } else {
                          displayAllFavorites();
                          print('Favorite matches size before add:$size\n');
                          match.addToMyFavorite();
                          print('Favorite matches size after add:$size\n');
                        }
                      },
                      icon: Icon(
                        Icons.bookmark,
                        /*match.isMyFavorite()
                            ? Icons.bookmark_added_outlined
                            : Icons.bookmark_add_outlined,*/
                        color: match.isMyFavorite()
                            ? Colors.orangeAccent
                            : Colors.grey,
                      )),
                  Text(
                    match.time.hour.toString() +
                        ":" +
                        match.time.minute.toString(),
                    style: const TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                  Text(
                    //"30 Oct",
                    DateFormat('dd MMM').format(match.time),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: width / 2 + 20,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  match.awayTeam.logo,
                  width: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  match.awayTeam.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SlideUpMatchCard extends StatelessWidget {
  const SlideUpMatchCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  final Match match;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Expanded(
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  match.homeTeam.name,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  child: Image.asset(
                    match.homeTeam.logo,
                    width: width / 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              children: [
                Icon(Icons.bookmark),
                SizedBox(
                  height: 12,
                ),
                Text("2/10"),
                Text("06 Sept"),
              ],
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              children: [
                Text(
                  match.awayTeam.name,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  child: Image.asset(
                    match.awayTeam.logo,
                    width: width / 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow> selectedCardBoxShadow() {
  return [
    const BoxShadow(
      color: Colors.grey,
      offset: Offset(
        3.0,
        3.0,
      ),
      blurRadius: 5.0,
      spreadRadius: 1.0,
    ),
    const BoxShadow(
      color: Colors.white,
      offset: Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    )
  ];
}

List<BoxShadow> unSelectedCardBoxShadow() {
  return [];
}

List<MatchCard> matchCards = [
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
  MatchCard(match: match1, isSelected: true),
  MatchCard(match: match2, isSelected: true),
  MatchCard(match: match3, isSelected: false),
  MatchCard(match: match4, isSelected: false),
  MatchCard(match: match5, isSelected: false),
  MatchCard(match: match6, isSelected: false),
  MatchCard(match: match7, isSelected: false),
  MatchCard(match: match8, isSelected: false),
  MatchCard(match: match9, isSelected: false),
  MatchCard(match: match10, isSelected: false),
];

void displayAllFavorites() {
  print(
      '----------------------------------------------- BEGIN--------------------------------------\n');
  for (int x = 0; x < favoriteMatches.length; x++) {
    Match m = favoriteMatches.elementAt(x);
    String y = m.toString();
    print('$y\n');
  }
  print(
      '----------------------------------------------- END---------------------------------------\n');
}
