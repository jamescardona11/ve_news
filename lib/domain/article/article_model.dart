class ArticleModel {
  final String uuid;
  final String title;
  final String url;
  final String body;
  final int sourceId;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final List<Concepts> concepts;
  final List<Category> categories;

  const ArticleModel({
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    required this.sourceId,
    this.isDuplicate = false,
    this.dateTime,
    this.lang,
    this.image,
    this.concepts = const [],
    this.categories = const [],
  });
}

class Concepts {
  String? uri;
  String? type;
  int? score;
  String? label;

  Concepts({this.uri, this.type, this.score, this.label});
}

class Category {
  String? uri;
  int? wgt;
  String? label;

  Category({this.uri, this.wgt, this.label});
}
