import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/clones_packages/datePicker/date_picker_widget.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/widgets/past_games_match_card.dart';

import 'package:frvb/model/competition.dart';

class PastGamesPage extends StatefulWidget {
  const PastGamesPage({Key? key}) : super(key: key);

  @override
  State<PastGamesPage> createState() => _PastGamesPageState();
}

class _PastGamesPageState extends State<PastGamesPage> {
  //var _selectedMatch = competition1.matches[0];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 14, top: 32, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Past Games",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      CupertinoIcons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color(0xffFFF8EE),
                  selectedTextColor: Colors.black,
                  selectedBorderColor: AppVars.selectedBorderColor,
                  onDateChange: (date) {
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Past Saved matches",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 12,
              ),
              /*Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: competition1.matches.map(
                      (e) {
                        return InkWell(
                            onTap: () => setState(() {
                                  _selectedMatch = e;
                                }),
                            child: PastGamesMatchCard(
                                width: width,
                                match: e,
                                isSelected: e == _selectedMatch));
                      },
                    ).toList(),
                  ),
                ),
              ),*/
            ],
          ),
        )));
  }
}
