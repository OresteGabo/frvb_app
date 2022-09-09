import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/widgets/live_match_column.dart';

import 'package:frvb/model/match.dart';

class LiveMatchCard extends StatelessWidget {
  const LiveMatchCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      /**
       * Do not add a padding top or bottom in here,
       * when doing so, remember to increase the card height in homepage where is is used, and redementionned
       * */
      padding: const EdgeInsets.only(left: 14, right: 14),
      //margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xff493f5d),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          //Divider(),
          Text(
            'SET ${match.awaySetsWon + match.homeSetsWon + 1}',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LiveMatchColumn(team: match.homeTeam, isHome: true),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${match.homeSetsWon}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                  //color: Colors.orangeAccent,
                                  color:
                                      const Color.fromRGBO(199, 100, 65, 0.7),
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        match.homeGoals.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        ":",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        match.awayGoals.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 6),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${match.awaySetsWon}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: const Color.fromRGBO(199, 100, 65, 0.7),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0x7e493f5d),
                        border: Border.all(color: Colors.orange, width: 2)),
                    child: Text(
                      '${Match.random(10, 100)}\'',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(200, 65, 54, 0.5),
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        color: Colors.red,
                        CupertinoIcons.antenna_radiowaves_left_right,
                      ),
                    ),
                  ),
                ],
              ),
              LiveMatchColumn(team: match.awayTeam, isHome: false),
            ],
          ),
        ],
      ),
    );
  }
}

List<LiveMatchCard> lmcList = [
  LiveMatchCard(
    match: match9,
  ),
  LiveMatchCard(
    match: match10,
  ),
  LiveMatchCard(
    match: match5,
  ),
  LiveMatchCard(
    match: match4,
  ),
];
