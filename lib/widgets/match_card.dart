import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    Key? key,
    required this.homeTeamImage,
    required this.awayTeamImage,
    required this.awayTeamName,
    required this.homeTeamName,
  }) : super(key: key);

  final String homeTeamImage;
  final String awayTeamImage;
  final String awayTeamName;
  final String homeTeamName;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
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
                  homeTeamName,
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
                SizedBox(
                  width: 8,
                ),
                Image.asset(
                  homeTeamImage,
                  width: 40,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
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
                  awayTeamImage,
                  width: 40,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  awayTeamName,
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
