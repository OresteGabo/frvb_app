import 'package:flutter/material.dart';
import 'package:frvb/model/match.dart';
import 'package:intl/intl.dart';

class MatchCard extends StatefulWidget {
  ///The current match to be used
  final Match match;

  ///indicate if the match is selected or not
  final bool isSelected;

  const MatchCard({
    Key? key,
    required this.match,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  late final Color fvrtMatchIconColor;
  late final Color selectedBorderColor;
  late final BoxShadow selectedBoxShadow;
  late final BoxDecoration nonSelectedBoxDecoration;

  late final Color unFvrtMatchIconColor;
  late final Color nonSelectedBorderColor;
  late final BoxShadow nonSelectedBoxShadow;
  late final BoxDecoration selectedBoxDecoration;

  @override
  void initState() {
    fvrtMatchIconColor = Colors.orangeAccent;
    selectedBorderColor = Colors.white;
    selectedBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey),
      //borderRadius: BorderRadius.circular(12),
    );
    selectedBoxShadow = const BoxShadow(
      color: Color.fromRGBO(211, 211, 211, 0.5),
      spreadRadius: 1,
      blurRadius: 15,
    );

    unFvrtMatchIconColor = Colors.grey;
    nonSelectedBorderColor = Colors.transparent;
    nonSelectedBoxShadow = const BoxShadow();
    nonSelectedBoxDecoration = BoxDecoration(
      color: Colors.grey[200],
      //border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      //padding: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration:
          widget.isSelected ? selectedBoxDecoration : nonSelectedBoxDecoration,
      /*BoxDecoration(
        color: widget.isSelected ? Colors.grey[200] : Colors.white,
        border: Border.all(
            color: widget.isSelected
                ? selectedBorderColor
                : nonSelectedBorderColor),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          widget.isSelected ? selectedBoxShadow : nonSelectedBoxShadow
        ],
        //boxShadow: widget.isSelected ? selectedBoxShadow : nonSetectedBoxShadow,
        //border: match.isMyFavorite() ? Border.all(color: Colors.orange) : null,
        //boxShadow:
        //isSelected ? selectedCardBoxShadow() : unSelectedCardBoxShadow(),
      ),*/

      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,

        children: [
          Positioned(
            right: width / 2 + 20,
            child: Row(
              children: [
                Text(
                  widget.match.homeTeam.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  widget.match.homeTeam.logo,
                  width: 40,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.green,
                  iconSize: 30,
                  onPressed: () {
                    //int size = favoriteMatches.length;

                    /*if (match.isMyFavorite()) {
                        displayAllFavorites();
                        print('Favorite matches size before removal:$size\n');

                        match.removeToMyFavorite();
                        print('Favorite matches size after removal:$size\n');
                      } else {
                        displayAllFavorites();
                        print('Favorite matches size before add:$size\n');
                        match.addToMyFavorite();
                        print('Favorite matches size after add:$size\n');
                      }*/
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: widget.match.isMyFavorite()
                        ? fvrtMatchIconColor
                        : unFvrtMatchIconColor,
                  ),
                ),
                Text(
                  widget.match.time.hour.toString() +
                      ":" +
                      widget.match.time.minute.toString(),
                  style: const TextStyle(color: Colors.orange, fontSize: 20),
                ),
                Text(
                  //"30 Oct",
                  DateFormat('dd MMM').format(widget.match.time),
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
          Positioned(
            left: width / 2 + 20,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  widget.match.awayTeam.logo,
                  width: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.match.awayTeam.name,
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
      //elevation: 1,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                match.homeTeam.name,
                style: const TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Image.asset(
                match.homeTeam.logo,
                width: width / 3,
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            children: [
              Icon(
                Icons.bookmark,
                color: match.isMyFavorite() ? Colors.orangeAccent : Colors.grey,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text("2/10"),
              const Text("06 Sept"),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            children: [
              Text(
                match.awayTeam.name,
                style: const TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Image.asset(
                match.awayTeam.logo,
                width: width / 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MatchCardList {
  final List<Match> _matches;

  MatchCardList(this._matches);

  void addMatch(Match m) {
    for (int x = 0; x < _matches.length; x++) {
      if (_matches.elementAt(x) == m) {
        return;
      }
    }
    _matches.add(m);
  }

  void removeMatch(Match m) {
    for (int x = 0; x < _matches.length; x++) {
      if (m == _matches.elementAt(x)) {
        _matches.removeAt(x);
      }
    }
  }

  List<MatchCard> getMatchCards() {
    List<MatchCard> mc = []; //= List(_matches.length);
    for (int x = 0; x < _matches.length; x++) {
      mc.add(MatchCard(match: _matches.elementAt(x)));
    }
    return mc;
  }
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
  /*print(
      '----------------------------------------------- BEGIN--------------------------------------\n');
  for (int x = 0; x < favoriteMatches.length; x++) {
    Match m = favoriteMatches.elementAt(x);
    String y = m.toString();
    print('$y\n');
  }
  print(
      '----------------------------------------------- END---------------------------------------\n');
*/
}
