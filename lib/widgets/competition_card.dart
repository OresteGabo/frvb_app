import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';

class CompetitionCard extends StatefulWidget {
  final Competition competition;
  const CompetitionCard({Key? key, required this.competition})
      : super(key: key);

  @override
  State<CompetitionCard> createState() => _CompetitionCardState();
}

class _CompetitionCardState extends State<CompetitionCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
