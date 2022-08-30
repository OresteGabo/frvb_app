import 'dart:math';
import 'package:frvb/model/team.dart';

class Match {
  final Team _homeTeam;
  final Team _awayTeam;
  late DateTime _time;
  late int _awayGoals;
  late int _homeGoals;

  Match(this._homeTeam, this._awayTeam) {
    _awayGoals = random(0, 3);
    _homeGoals = random(0, 3);
    _time = DateTime(
      random(2020, 2024),
      random(1, 12),
      random(1, 28),
      random(1, 12),
      random(0, 59),
    );
    addToMyFavorite();
  }
  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  int get awayGoals => _awayGoals;

  int get homeGoals => _homeGoals;

  Team get homeTeam => _homeTeam;

  Team get awayTeam => _awayTeam;

  String get timeString {
    return _time.day.toString() +
        "/" +
        _time.month.toString() +
        "/" +
        _time.year.toString() +
        "  " +
        _time.hour.toString() +
        ":" +
        _time.minute.toString();
  }

  void addToMyFavorite() {
    String x = toString();
    if (this.isMyFavorite()) {
      print(
          '###################################  $x already exist in my favorite\n');
    } else {
      favoriteMatches.add(this);
    }
  }

  void removeToMyFavorite() {
    String x = toString();
    if (this.isMyFavorite()) {
      favoriteMatches.remove(this);
    } else {
      print('################################   $x is not among my favorites');
    }
  }

  bool isOneOfTheTeamMyFavorite() {
    return _homeTeam.isMyFavorite() || _awayTeam.isMyFavorite();
  }

  bool isMyFavorite() {
    return _homeTeam.isMyFavorite() || _awayTeam.isMyFavorite();
  }

  @override
  String toString() {
    String awayTeamName = _awayTeam.name;
    String homeTeamName = _homeTeam.name;
    return '(Away) $awayTeamName $_awayGoals : $_homeGoals $homeTeamName (Home) ';
  }
}

List<Match> favoriteMatches = [];

Match match1 = Match(gisagara, kvc);
Match match2 = Match(gisagara, aprvc);
Match match3 = Match(gsob, aprvc);
Match match4 = Match(aprvc, reg);
Match match5 = Match(reg, kvc);
Match match7 = Match(kirehe, muzinga);
Match match6 = Match(ndejje, aprvc);
Match match8 = Match(gsob, rayon);
Match match9 = Match(rukinzo, reg);
Match match10 = Match(utb, unik);

List<Match> matches = [
  match1,
  match2,
  match3,
  match4,
  match5,
  match6,
  match7,
  match8,
  match9,
  match10,
];
