import 'package:flutter/material.dart';
import 'package:frvb/widgets/live_match_column.dart';

import 'package:frvb/constants.dart';
import 'package:frvb/model/team.dart';
import 'package:frvb/model/match.dart';

class LiveMatchCard extends StatelessWidget {
  const LiveMatchCard({
    Key? key,
    required this.width,
    required this.height,
    required this.match,
  }) : super(key: key);

  final double width;
  final double height;
  final Match match;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 16),
      width: width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xff3d195b),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "DIV 1 Champ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Week 10",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LiveMatchColumn(team: match.homeTeam, isHome: true),
              Column(
                children: [
                  Row(
                    children: [
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
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff633565),
                        border: Border.all(color: pinkColor, width: 2)),
                    child: const Text(
                      "83'",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
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
