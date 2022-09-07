import 'package:flutter/material.dart';
import '../model/team.dart';

class LiveMatchColumn extends StatelessWidget {
  const LiveMatchColumn({
    Key? key,
    required this.team,
    required this.isHome,
  }) : super(key: key);

  final Team team;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            team.logo,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          team.name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          isHome ? "Home" : "Away",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}
