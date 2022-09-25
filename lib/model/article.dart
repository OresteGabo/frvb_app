class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;
  int likesCount;

  Article(
      {this.text = "",
      this.domain = "",
      this.by = "",
      this.age = "",
      this.score = 0,
      this.commentsCount = 0,
      this.likesCount = 0});
}

var articles = [
  Article(
    text:
        "Habimana yavuye imuzi amateka ya Volleyball yabaye umuhuza w’abigaga muri UNR (Video)",
    domain:
        "https://igihe.com/imikino/volleyball/article/habimana-jean-bosco-yavuye-imuzi-amateka-ya-volleyball-mu-rwanda-yabaye-umuhuza",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 47,
  ),
  Article(
    text: "Yves Mutabazi agiye kwimukira muri Amerika",
    domain:
        "https://igihe.com/imikino/volleyball/article/yves-mutabazi-agiye-kwimukira-muri-leta-zunze-ubumwe-za-amerika",
    by: "Nsengiyumva Emmy",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text:
        "U Rwanda rwamenye itsinda ruherereyemo mu marushanwa Nyafurika ya Volleyball",
    domain:
        "https://igihe.com/imikino/volleyball/article/u-rwanda-rwamenye-itsinda-ruherereyemo-mu-marushanwa-nyafurika-ya-volleyball",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text: "Gisagara VC na RRA VC zegukanye ibikombe muri Gisaka Open",
    domain:
        "https://igihe.com/imikino/volleyball/article/gisagara-vc-na-rra-vc-zegukanye-ibikombe-muri-gisaka-open",
    by: "Hakizimana jean paul",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text:
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text:
        "Ntagengwa na Gatsinzi barahura n’Abanyafurika y’Epfo muri Commonwealth Games 2022",
    domain:
        "https://igihe.com/imikino/volleyball/article/volleyball-rra-vc-yasinyishije-abakinnyi-batatu-bashya",
    by: "Nsengiyumva Emmy",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text:
        "Tunisie: RRA VC yatsinze EWW yo muri Ghana mu guhatanira imyanya myiza",
    domain:
        "https://igihe.com/imikino/volleyball/article/tunisie-rra-vc-yatsinze-eww-yo-muri-ghana-mu-guhatanira-imyanya-myiza",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text:
        "Volleyball: Green Park yegukanye igikombe mu mikino y’abakanyujijeho",
    domain:
        "https://igihe.com/imikino/volleyball/article/volleyball-green-park-yegukanye-igikombe-mu-mikino-y-abakanyujijeho",
    by: "Nsengiyumva Emmy",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text: "Volleyball: I Gisagara hasojwe umwiherero wo gushaka impano",
    domain:
        "https://www.kigalitoday.com/imikino-11/volleyball/article/volleyball-i-gisagara-hasojwe-umwiherero-wo-gushaka-impano",
    by: "Amon B. Nuwamanya",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text: "Volleyball U21: U Rwanda rusoreje irushanwa ku mwanya wa 8",
    domain:
        "https://www.kigalitoday.com/imikino-11/volleyball/article/volleyball-u21-u-rwanda-rusoreje-irushanwa-ku-mwanya-wa-8",
    by: "Amon B. Nuwamanya",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text: "Volleyball U21: U Rwanda ruracakirana na Tunisia kuri uyu wa gatanu",
    domain:
        "https://www.kigalitoday.com/imikino-11/volleyball/article/volleyball-u21-u-rwanda-ruracakirana-na-tunisia-kuri-uyu-wa-gatanu",
    by: " Amon B. Nuwamanya ",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text: "Volleyball U21: U Rwanda rutsinzwe umukino wa kabiri",
    domain:
        "https://www.kigalitoday.com/imikino-11/volleyball/article/volleyball-u21-u-rwanda-rutsinzwe-umukino-wa-kabiri",
    by: " Amon B. Nuwamanya ",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),
  Article(
    text: "Gisagara: Bakomeje gushaka impano mu mukino wa Volleyball",
    domain:
        "https://www.kigalitoday.com/imikino-11/volleyball/article/gisagara-bakomeje-gushaka-impano-mu-mukino-wa-volleyball",
    by: "Amon B. Nuwamanya",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
];
