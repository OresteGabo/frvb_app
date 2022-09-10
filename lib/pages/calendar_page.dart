import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/clones_packages/datePicker/date_picker_widget.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/model/mensdiv1comp.dart';
import 'package:frvb/model/match.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  var _selectedMatch = competition1.matches[0];
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
                    "Calendar",
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
                "Men's DIV 1 Chapmpionship",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: competition1.matches.map(
                      (e) {
                        return InkWell(
                            onTap: () => setState(() {
                                  _selectedMatch = e;
                                }),
                            child: CalendarMatchCard(
                                width: width,
                                match: e,
                                isSelected: e == _selectedMatch));
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

class CalendarMatchCard extends StatefulWidget {
  final Match match;
  final double width;
  late bool isSelected;
  late bool isFavorite;
  //final VoidCallback onPressed;
  CalendarMatchCard({
    Key? key,
    required this.match,
    required this.width,
    //required this.onPressed,
    this.isFavorite = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<CalendarMatchCard> createState() => _CalendarMatchCardState();
}

class _CalendarMatchCardState extends State<CalendarMatchCard> {
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
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.isFavorite = !widget.isFavorite;
                  //widget.isSelected = !widget.isSelected;
                });
              },
              child: Container(
                height: 40,
                child: Icon(
                  Icons.bookmark,
                  color:
                      widget.isFavorite ? AppVars.selectedColor : Colors.grey,
                  size: 45,
                ),
              ),
            ),
          ),
          Text(
            widget.match.timeString,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          //TeamRow(score: homeGoals, teamName: homeName, image: homeImage),
          TeamRow(
              score: widget.match.homeGoals,
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
              score: widget.match.awayGoals,
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
