class ArticleDto {
  final String uuid;
  final String title;
  final String url;
  final String body;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final SourceDto? source;
  final List<ConceptsDto> concepts;
  final List<CategoryDto> categories;

  const ArticleDto({
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    this.isDuplicate = false,
    this.dateTime,
    this.lang,
    this.image,
    this.source,
    this.concepts = const [],
    this.categories = const [],
  });
}

class SourceDto {
  String? uri;
  String? dataType;
  String? title;

  SourceDto({this.uri, this.dataType, this.title});
}

class ConceptsDto {
  String? uri;
  String? type;
  int? score;
  String? label;

  ConceptsDto({this.uri, this.type, this.score, this.label});
}

class CategoryDto {
  String? uri;
  int? wgt;
  String? label;

  CategoryDto({this.uri, this.wgt, this.label});
}
