class ArticleModel {
  final String uuid;
  final String title;
  final String url;
  final String body;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final Source? source;
  final List<Concepts> concepts;

  const ArticleModel({
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    this.isDuplicate = false,
    this.dateTime,
    this.lang,
    this.image,
    this.source,
    required this.concepts,
  });
}

class Source {
  String? uri;
  String? dataType;
  String? title;

  Source({this.uri, this.dataType, this.title});
}

class Concepts {
  String? uri;
  String? type;
  int? score;
  String? label;

  Concepts({this.uri, this.type, this.score, this.label});
}
