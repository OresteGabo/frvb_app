class Team {
  final String logo;
  final String name;
  late final fullName;

  Team(
      {required this.logo, required this.name, this.fullName = "NO FULL NAME"});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  //String get fullName => _fullName;

  bool isMyFavorite() {
    for (int x = 0; x < favoriteTeams.length; x++) {
      if (this == favoriteTeams[x]) {
        return true;
      }
    }
    return false;
  }
}

final Team gisagara =
    Team(logo: "assets/clubs/gisagara.webp", name: "Gisagara");
final Team aprvc = Team(logo: "assets/clubs/aprvc.png", name: "APR VC");
final Team christianUniv =
    Team(logo: "assets/clubs/christianuniversity.webp", name: "ChrisUnv");
final Team bugiri = Team(logo: "assets/clubs/bugirivbc", name: "BUGIRI");
final Team sainJoseph =
    Team(logo: "assets/clubs/gs_saint-joseph", name: "st Joseph");
final Team gsjinaa = Team(logo: "assets/clubs/gsjinja.png", name: "GS JINJA");
final Team gsob = Team(logo: "assets/clubs/gsob.png", name: "GSOB");
final Team iprcsouth =
    Team(logo: "assets/clubs/iprcsouth.png", name: "IPRC ST");
final Team kavc = Team(logo: "assets/clubs/kavc.webp", name: "KAVC");
final Team kirehe = Team(logo: "assets/clubs/kirehe.png", name: "KIREHE");
final Team kvc = Team(logo: "assets/clubs/kvc.png", name: "KVC");
final Team muzinga = Team(logo: "assets/clubs/muzinga.webp", name: "MUZINGA");
final Team ndejje = Team(logo: "assets/clubs/ndejje.webp", name: "NDEJJE");
final Team nemostars =
    Team(logo: "assets/clubs/nemostars.webp", name: "NEMOSTARS");
final Team rayon = Team(logo: "assets/clubs/rayon.webp", name: "RAYON VC");
final Team reg = Team(logo: "assets/clubs/reg.webp", name: "REG VC");
final Team rra = Team(logo: "assets/clubs/rra.png", name: "RRA VC");
final Team rukinzo = Team(logo: "assets/clubs/rukinzo.png", name: "RUKINZO");
final Team rwandaarmy =
    Team(logo: "assets/clubs/rwandaarmy.png", name: "RW ARMY VC");
final Team unik = Team(logo: "assets/clubs/unik.webp", name: "UNIK VC");
final Team ur = Team(logo: "assets/clubs/ur.png", name: "UR VC");
final Team utb =
    Team(logo: "assets/clubs/utb_cropped_logo.png", name: "UTB VC");

List<Team> favoriteTeams = [
  gisagara,
  aprvc,
];
