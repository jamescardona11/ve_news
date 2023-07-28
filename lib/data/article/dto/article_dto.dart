import 'package:json_annotation/json_annotation.dart';

part 'article_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleDto {
  @JsonKey(name: 'uri')
  final String uuid;
  final String title;
  final String url;
  final String body;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;

  @JsonKey(name: 'source', fromJson: _sourceFromJson)
  final String? sourceUri;
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
    this.sourceUri,
    this.concepts = const [],
    this.categories = const [],
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);

  static String? _sourceFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return json['uri'];
  }
}

@JsonSerializable(explicitToJson: true)
class ConceptsDto {
  final String? uri;
  final String? type;
  final int? score;

  @JsonKey(fromJson: _labelFromJson)
  final String? label;

  const ConceptsDto({this.uri, this.type, this.score, this.label});

  factory ConceptsDto.fromJson(Map<String, dynamic> json) => _$ConceptsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConceptsDtoToJson(this);

  static String? _labelFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return json['eng'];
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  final String? uri;
  final int? wgt;
  final String? label;

  const CategoryDto({this.uri, this.wgt, this.label});

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
