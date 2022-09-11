import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/constants.dart';

class CompetitionCard extends StatefulWidget {
  final Competition competition;
  final double width;
  late bool isSelected;
  late bool isFavorite;
  CompetitionCard({
    Key? key,
    required this.competition,
    required this.width,
    this.isFavorite = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<CompetitionCard> createState() => _CompetitionCardState();
}

class _CompetitionCardState extends State<CompetitionCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                widget.competition.start.toString(),
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
          /*TeamRow(
              score: widget.match.homeSetsWon,
              teamName: widget.match.homeTeam.name,
              image: widget.match.homeTeam.logo),*/
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
          /*TeamRow(
              score: widget.match.awaySetsWon,
              teamName: widget.match.awayTeam.name,
              image: widget.match.awayTeam.logo),*/
        ],
      ),
    );
  }
}
