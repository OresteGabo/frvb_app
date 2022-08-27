import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/model/mensdiv1comp.dart';
import 'package:frvb/model/team.dart';
import 'package:frvb/model/match.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
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
                decoration: const BoxDecoration(color: Colors.white),
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: pinkColor,
                  selectedTextColor: Colors.white,
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
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: div1games
                        .map(
                          (e) => CalendarMatchCard(
                            width: width,
                            isSelected: e.isSelected,
                            onPressed: () {
                              setState(() {
                                e.isSelected = !e.isSelected;
                              });
                            },
                            match: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

class CalendarMatchCard extends StatelessWidget {
  const CalendarMatchCard({
    Key? key,
    required this.match,
    required this.width,
    /*required this.homeName,
    required this.awayName,
    required this.awayGoals,
    required this.homeGoals,
    required this.homeImage,
    required this.awayImage,*/
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final Match match;
  final double width;
  /*final String homeName;
  final String awayName;
  final String awayGoals;
  final String homeGoals;
  final String homeImage;
  final String awayImage;*/
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Match match6 = Match(gsob, aprvc);
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2,
              color: isSelected ? selectedColor : Colors.transparent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                height: 40,
                child: Image(
                  image: const AssetImage(
                    "assets/later.png",
                  ),
                  color: isSelected ? selectedColor : Colors.grey,
                ),
              ),
            ),
          ),
          const Text(
            "Yesterday, 9:27 PM",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
          //TeamRow(score: homeGoals, teamName: homeName, image: homeImage),
          TeamRow(
              score: match.homeGoals,
              teamName: match.homeTeam.name,
              image: match.homeTeam.logo),
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
              score: match.awayGoals,
              teamName: match.awayTeam.name,
              image: match.awayTeam.logo),
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
