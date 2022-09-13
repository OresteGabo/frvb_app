import 'package:frvb/model/team.dart';
import 'package:frvb/model/match.dart';

class Competition {
  final String images;
  final String name;
  final DateTime start;
  final DateTime end;
  final String description;
  List<Team> teams;

  Competition({
    this.images = '',
    required this.name,
    required this.start,
    required this.end,
    required this.description,
    required this.teams,
  });
  void addMatch(Match m) {
    matches.add(m);
  }

  List<String> teamLogos() {
    List<String> logos = [
      "assets/bg_dk.png",
    ];
    for (int x = 0; x < teams.length; x++) {
      logos.add(teams[x].logo);
    }
    return logos;
  }
}

var competition1 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    teams: [
      aprvc,
      kvc,
      kirehe,
    ]);
var competition2 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    teams: [
      gisagara,
      rukinzo,
      rra,
    ]);
var competition3 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    teams: [
      kirehe,
      reg,
      kvc,
    ]);

List<Competition> competitions = [
  competition1,
  competition2,
  competition3,
];
