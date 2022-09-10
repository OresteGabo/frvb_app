import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/model/match.dart';

class PastGamesMatchCard extends StatefulWidget {
  final Match match;
  final double width;
  late bool isSelected;
  late bool isFavorite;
  //final VoidCallback onPressed;
  PastGamesMatchCard({
    Key? key,
    required this.match,
    required this.width,
    //required this.onPressed,
    this.isFavorite = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<PastGamesMatchCard> createState() => _PastGamesMatchCardState();
}

class _PastGamesMatchCardState extends State<PastGamesMatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: widget.isSelected ? AppVars.selectedColor : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.match.timeString,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.isFavorite = !widget.isFavorite;
                  });
                },
                child: SizedBox(
                  height: 45,
                  child: Icon(
                    widget.isFavorite
                        ? Icons.bookmark
                        : Icons.bookmark_outline_rounded,
                    color:
                        widget.isFavorite ? AppVars.selectedColor : Colors.grey,
                    size: 45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          TeamRow(
              score: widget.match.homeSetsWon,
              teamName: widget.match.homeTeam.name,
              image: widget.match.homeTeam.logo),
          Row(
            children: const [
              SizedBox(
                width: 60,
              ),
              Text(
                "vs",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Expanded(child: Divider()),
            ],
          ),
          TeamRow(
              score: widget.match.awaySetsWon,
              teamName: widget.match.awayTeam.name,
              image: widget.match.awayTeam.logo),
        ],
      ),
    );
  }
}

class TeamRow extends StatelessWidget {
  const TeamRow({
    Key? key,
    required this.teamName,
    required this.score,
    required this.image,
  }) : super(key: key);

  final String teamName;
  final int score;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          teamName,
          style: const TextStyle(color: Colors.black, fontSize: 22),
        ),
        const Spacer(
          flex: 4,
        ),
        Text(
          score.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 24),
        ),
      ],
    );
  }
}
