import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/clones_packages/avatar_group/avatar_group.dart';
import 'package:intl/intl.dart';

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
        color: const Color.fromARGB(62, 175, 135, 76),
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
                '${DateFormat('dd MMM').format(widget.competition.start)} to ${DateFormat('dd MMM yyyy').format(widget.competition.end)}',
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
                    color: widget.isFavorite
                        ? AppVars.selectedColor
                        : Colors.black,
                    size: 45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: const [
              Expanded(child: Divider()),
              Expanded(child: Divider()),
            ],
          ),
          const Text(
              "This is the description text that describes a competition in a very brief resume This is the description text that describes a competition in a very brief resume  "),
          Row(
            children: [
              const Spacer(),
              AvatarGroup(
                widthFactor: 0.2,
                imagesList: widget.competition.teamLogos(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
