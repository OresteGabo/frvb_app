import 'package:flutter/material.dart';
import 'package:frvb/model/team.dart';

class Match {
  Team _homeTeam;
  Team _awayTeam;
  DateTime _time;

  Match(this._homeTeam, this._awayTeam, this._time);

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  Team get awayTeam => _awayTeam;

  set awayTeam(Team value) {
    _awayTeam = value;
  }

  Team get homeTeam => _homeTeam;

  set homeTeam(Team value) {
    _homeTeam = value;
  }
}

Match match1 = Match(gisagara, kvc, DateTime.now());
Match match2 = Match(gisagara, aprvc, DateTime.now());
Match match3 = Match(gsob, aprvc, DateTime.now());
Match match4 = Match(aprvc, reg, DateTime.now());
Match match5 = Match(reg, kvc, DateTime.now());
Match match7 = Match(kirehe, muzinga, DateTime.now());
Match match6 = Match(ndejje, aprvc, DateTime.now());
Match match8 = Match(gsob, rayon, DateTime.now());
Match match9 = Match(rukinzo, reg, DateTime.now());
Match match10 = Match(utb, unik, DateTime.now());
