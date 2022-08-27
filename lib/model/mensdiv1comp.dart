import 'package:frvb/model/match.dart';
import 'package:frvb/model/team.dart';

class Div1Matches extends Match {
  bool isSelected;

  Div1Matches(super.homeTeam, super.awayTeam, this.isSelected);
}

List<Div1Matches> div1games = [
  Div1Matches(gsob, aprvc, false),
  Div1Matches(reg, kirehe, false),
  Div1Matches(kvc, gisagara, false)
];
