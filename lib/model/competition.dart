import 'package:frvb/model/team.dart';
import 'package:frvb/model/match.dart';

class Competition {
  final String images;
  final String name;
  final DateTime start;
  final DateTime end;
  final String description;
  List<Match> matches;

  Competition({
    this.images = '',
    required this.name,
    required this.start,
    required this.end,
    required this.description,
    required this.matches,
  });
  void addMatch(Match m) {
    matches.add(m);
  }
}

var competition1 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    matches: [
      match1,
      match2,
      match3,
    ]);
var competition2 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    matches: [
      match1,
      match2,
      match3,
    ]);
var competition3 = Competition(
    name: "Rutsindura",
    start: DateTime.now(),
    end: DateTime.now(),
    description:
        "This is a rutsindura competition to remember alphose rutsindura who passed away in 1994",
    matches: [
      match1,
      match2,
      match3,
    ]);

List<Competition> competitions = [
  competition1,
  competition2,
  competition3,
];
