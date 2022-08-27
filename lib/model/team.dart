class Team {
  String _logo;
  String _name;

  Team(this._logo, this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get logo => _logo;

  set logo(String value) {
    _logo = value;
  }
}

final Team gisagara = Team("assets/clubs/gisagara.webp", "Gisagara");
final Team aprvc = Team("assets/clubs/aprvc.png", "APR VC");
final Team christianUniv =
    Team("assets/clubs/christianuniversity.webp", "ChrisUnv");
final Team bugiri = Team("assets/clubs/bugirivbc", "BUGIRI");
final Team sainJoseph = Team("assets/clubs/gs_saint-joseph", "st Joseph");
final Team gsjinaa = Team("assets/clubs/gsjinja.png", "GS JINJA");
final Team gsob = Team("assets/clubs/gsob.png", "GSOB");
final Team iprcsouth = Team("assets/clubs/iprcsouth.png", "IPRC ST");
final Team kavc = Team("assets/clubs/kavc.webp", "KAVC");
final Team kirehe = Team("assets/clubs/kirehe.png", "KIREHE");
final Team kvc = Team("assets/clubs/kvc.png", "KVC");
final Team muzinga = Team("assets/clubs/muzinga.webp", "MUZINGA");
final Team ndejje = Team("assets/clubs/ndejje.webp", "NDEJJE");
final Team nemostars = Team("assets/clubs/nemostars.webp", "NEMOSTARS");
final Team rayon = Team("assets/clubs/rayon.webp", "RAYON VC");
final Team reg = Team("assets/clubs/reg.webp", "REG VC");
final Team rra = Team("assets/clubs/rra.png", "RRA VC");
final Team rukinzo = Team("assets/clubs/rukinzo.png", "RUKINZO");
final Team rwandaarmy = Team("assets/clubs/rwandaarmy.png", "RW ARMY VC");
final Team unik = Team("assets/clubs/unik.webp", "UNIK VC");
final Team ur = Team("assets/clubs/ur.png", "UR VC");
final Team utb = Team("assets/clubs/utb_cropped_logo.png", "UTB VC");
