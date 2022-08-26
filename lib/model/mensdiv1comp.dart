class Div1Matches {
  String imageHome;
  String imageAway;
  String nameHome;
  String nameAway;
  String goalsHome;
  String goalsAway;
  bool isSelected;

  Div1Matches({
    this.imageHome = '',
    this.imageAway = '',
    this.nameHome = '',
    this.nameAway = '',
    this.goalsHome = '',
    this.goalsAway = '',
    this.isSelected = false,
  });
}

List<Div1Matches> europeLeagueGames = [
  Div1Matches(
      imageHome: "assets/clubs/rayon.webp",
      nameHome: "Rayon",
      imageAway: "assets/clubs/aprvc.png",
      nameAway: "APR VC",
      goalsAway: "3",
      goalsHome: "3",
      isSelected: true),
  Div1Matches(
      imageHome: "assets/clubs/gsob.png",
      nameHome: "GSOB",
      imageAway: "assets/clubs/aprvc.png",
      nameAway: "APRVC",
      goalsAway: "0",
      goalsHome: "3",
      isSelected: false),
  Div1Matches(
      imageHome: "assets/clubs/reg.webp",
      nameHome: "REG VC",
      imageAway: "assets/clubs/kirehe.png",
      nameAway: "KIREHE",
      goalsAway: "3",
      goalsHome: "2",
      isSelected: false),
  Div1Matches(
      imageHome: "assets/clubs/kvc.png",
      nameHome: "KVC",
      imageAway: "assets/clubs/gisagara.webp",
      nameAway: "Gisagara",
      goalsAway: "1",
      goalsHome: "1",
      isSelected: false),
];
