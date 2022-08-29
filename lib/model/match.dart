import 'package:flutter/material.dart';
import 'package:frvb/model/team.dart';

class Match {
  Team _homeTeam;
  Team _awayTeam;
  late DateTime _time;
  late int _awayGoals;
  late int _homeGoals;

  Match(this._homeTeam, this._awayTeam) {
    _awayGoals = 0;
    _homeGoals = 0;
    _time = DateTime.now();
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

  bool isMyFavorite() {
    return _homeTeam.isMyFavorite() || _awayTeam.isMyFavorite();
  }
}

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
