import 'dart:math';
import 'package:frvb/model/team.dart';

class Match {
  final Team _homeTeam;
  final Team _awayTeam;
  late DateTime _time;
  late int _awayGoals;
  late int _homeGoals;
  int _currentSet = 0;
  int _awaySetsWon = 0;
  int _homeSetsWon = 0;

  Match(this._homeTeam, this._awayTeam) {
    _awayGoals = Math.random(0, 25);
    _homeGoals = Math.random(0, 25);
    _awaySetsWon = Math.random(0, 3);
    _homeSetsWon = Math.random(0, 3);
    _currentSet = Math.random(1, 5);
    _time = DateTime(
      Math.random(2020, 2024),
      Math.random(1, 12),
      Math.random(1, 28),
      Math.random(1, 12),
      Math.random(0, 59),
    );
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  int get awayGoals => _awayGoals;

  int get currentSet => _currentSet;
  int get awaySetsWon => _awaySetsWon;
  int get homeSetsWon => _homeSetsWon;

  int get homeGoals => _homeGoals;

  Team get homeTeam => _homeTeam;

  Team get awayTeam => _awayTeam;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Match &&
            runtimeType == other.runtimeType &&
            _homeTeam == other._homeTeam &&
            _awayTeam == other._awayTeam &&
            _time == other._time;
  }

  @override
  int get hashCode => _homeTeam.hashCode ^ _awayTeam.hashCode ^ _time.hashCode;

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

class Math {
  static int random(min, max) {
    return min + Random().nextInt(max - min);
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
