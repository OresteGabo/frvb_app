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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
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
  /*Article(
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
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
        "Amakipe azaserukira u Rwanda akomeje kwitegura Shampiyona y’Isi muri Sitting Volleyball ",
    domain:
        "https://igihe.com/imikino/volleyball/article/amakipe-azaserukira-u-rwanda-akomeje-kwitegura-shampiyona-y-isi-muri-sitting",
    by: "iradukunda olivier",
    age: "2 hours",
    score: 25,
    commentsCount: 45,
  ),
  Article(
    text: "Yves Mutabazi agiye kwimukira muri Amerika",
    domain:
        "https://igihe.com/imikino/volleyball/article/yves-mutabazi-agiye-kwimukira-muri-leta-zunze-ubumwe-za-amerika",
    by: "Nsengiyumva Emmy",
    age: "3 days",
    score: 34,
    commentsCount: 45,
  ),*/
];
