import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';

import '../widgets/competition_card.dart';

class CompetitionsPage extends StatefulWidget {
  const CompetitionsPage({Key? key}) : super(key: key);

  @override
  State<CompetitionsPage> createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionsPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var _selectedCompetition = competitions[1];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: competitions.map(
            (e) {
              return InkWell(
                onTap: () => setState(() {
                  _selectedCompetition = e;
                }),
                child: CompetitionCard(
                  width: width,
                  isSelected: e == _selectedCompetition,
                  competition: _selectedCompetition,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
