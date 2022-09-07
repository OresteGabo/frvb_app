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
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xff493f5d),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            'SET ${match.awaySetsWon + match.homeSetsWon}',
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
                        decoration: const BoxDecoration(
                            //color: Colors.green,
                            ),
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
                                //color: Colors.orangeAccent,
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
                        //Icons.radio_button_unchecked_rounded,
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
    match: match10,
  ),
  LiveMatchCard(
    match: match10,
  ),
];
