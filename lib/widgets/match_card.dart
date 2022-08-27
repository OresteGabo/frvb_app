import 'package:flutter/material.dart';
import 'package:frvb/model/match.dart';
import 'package:frvb/model/team.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  final Match match;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            child: Column(
              children: const [
                Text(
                  "06:30",
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                Text(
                  "30 Oct",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
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
