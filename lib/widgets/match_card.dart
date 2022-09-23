import 'package:flutter/material.dart';
import 'package:frvb/model/match.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';

class MatchCard extends StatefulWidget {
  ///The current match to be used
  final Match match;

  ///indicate if the match is selected or not
  final bool isSelected;

  ///is
  bool isFavorite;
  bool isSaved;

  MatchCard(
      {Key? key,
      required this.match,
      this.isSelected = false,
      this.isFavorite = false,
      this.isSaved = false})
      : super(key: key);

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
    //selectedBorderColor = Colors.white;
    selectedBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      //color: Colors.grey[200],
      border: Border.all(color: Colors.grey),
      //borderRadius: BorderRadius.circular(12),
    );
    selectedBoxShadow = const BoxShadow(
      //color: Color.fromRGBO(211, 211, 211, 0.5),
      spreadRadius: 1,
      blurRadius: 15,
    );

    unFvrtMatchIconColor = Colors.grey;
    nonSelectedBorderColor = Colors.transparent;
    nonSelectedBoxShadow = const BoxShadow();
    nonSelectedBoxDecoration = BoxDecoration(
      //color: Colors.grey[200],
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    );
    super.initState();
  }

  void saveUnsave() {
    widget.isSaved = !widget.isSaved;
  }

  void fvrtUnFvrt() {
    widget.isFavorite = !widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
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
                  widget.match.homeTeam.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black87),
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
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      fvrtUnFvrt();
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: widget.isFavorite
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
                  DateFormat('dd MMM').format(widget.match.time),
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Positioned(
            left: width / 2 + 20,
            child: Row(
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
                  style: TextStyle(
                      fontSize: 20,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black87),
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
];
