// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/source/source_model.dart';

part 'article_dto.g.dart';

@collection
@Name('Article')
@JsonSerializable(explicitToJson: true)
class ArticleDto {
  final Id id;

  @Index(unique: true, replace: true)
  @JsonKey(name: 'uri')
  final String uuid;
  final String title;
  final String url;
  final String body;
  final bool isDuplicate;
  final bool bookmark;
  final DateTime? dateTime;
  final String? lang;
  final String? image;

  @Ignore()
  @JsonKey(name: 'source', fromJson: _sourceFromJson)
  final String? sourceUri;

  @JsonKey(includeFromJson: false)
  final int? sourceId;
  final List<ConceptsDto> concepts;
  final List<CategoryDto> categories;

  const ArticleDto({
    this.id = Isar.autoIncrement,
    required this.uuid,
    required this.title,
    required this.url,
    required this.body,
    this.sourceId,
    this.isDuplicate = false,
    this.bookmark = false,
    this.dateTime,
    this.lang,
    this.image,
    this.sourceUri,
    this.concepts = const [],
    this.categories = const [],
  });

  ArticleModel toModel(SourceModel source) => ArticleModel(
        id: id,
        uuid: uuid,
        title: title,
        url: url,
        body: body,
        isDuplicate: isDuplicate,
        bookmark: bookmark,
        dateTime: dateTime,
        lang: lang,
        image: image,
        source: source,
        concepts: concepts.map((e) => e.toModel()).toList(),
        categories: categories.map((e) => e.toModel()).toList(),
      );

  factory ArticleDto.fromJson(Map<String, dynamic> json) => _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);

  static String? _sourceFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return json['uri'];
  }

  ArticleDto copyWith({
    Id? id,
    String? uuid,
    String? title,
    String? url,
    String? body,
    bool? isDuplicate,
    bool? bookmark,
    DateTime? dateTime,
    String? lang,
    String? image,
    String? sourceUri,
    int? sourceId,
    List<ConceptsDto>? concepts,
    List<CategoryDto>? categories,
  }) {
    return ArticleDto(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      url: url ?? this.url,
      body: body ?? this.body,
      isDuplicate: isDuplicate ?? this.isDuplicate,
      bookmark: bookmark ?? this.bookmark,
      dateTime: dateTime ?? this.dateTime,
      lang: lang ?? this.lang,
      image: image ?? this.image,
      sourceUri: sourceUri ?? this.sourceUri,
      sourceId: sourceId ?? this.sourceId,
      concepts: concepts ?? this.concepts,
      categories: categories ?? this.categories,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@embedded
class ConceptsDto {
  final String? uri;
  final String? type;
  final int? score;

  @JsonKey(fromJson: _labelFromJson)
  final String? label;

  const ConceptsDto({this.uri, this.type, this.score, this.label});

  Concepts toModel() => Concepts(
        uri: uri,
        type: type,
        score: score,
        label: label,
      );

  factory ConceptsDto.fromJson(Map<String, dynamic> json) => _$ConceptsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConceptsDtoToJson(this);

  static String? _labelFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return json['eng'];
  }
}

@JsonSerializable(explicitToJson: true)
@embedded
class CategoryDto {
  final String? uri;
  final int? wgt;
  final String? label;

  const CategoryDto({this.uri, this.wgt, this.label});

  Category toModel() => Category(
        uri: uri,
        wgt: wgt,
        label: label,
      );

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
