import 'package:flutter/material.dart';
import 'package:frvb/widgets/live_match_column.dart';

import '../constants.dart';
import '../model/team.dart';

class LiveMatchCard extends StatelessWidget {
  const LiveMatchCard({
    Key? key,
    required this.width,
    required this.heigth,
    required this.homeTeam,
    required this.awayTeam,
  }) : super(key: key);

  final double width;
  final double heigth;
  final Team homeTeam;
  final Team awayTeam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(right: 16),
      width: width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xff3d195b),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "DIV 1 Champ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Week 10",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LiveMatchColumn(team: homeTeam, isHome: true),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "2",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        ":",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "3",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff633565),
                        border: Border.all(color: pinkColor, width: 2)),
                    child: Text(
                      "83'",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
              LiveMatchColumn(team: awayTeam, isHome: false),
            ],
          ),
        ],
      ),
    );
  }
}
