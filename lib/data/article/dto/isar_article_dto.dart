import 'package:isar/isar.dart';
import 'package:ve_news/domain/article/article_model.dart';

part 'isar_article_dto.g.dart';

@collection
@Name('Article')
class IsarArticleDto {
  final Id id;
  final String uuid;
  final String title;
  final String url;
  final String body;
  final int sourceId;
  final bool isDuplicate;
  final DateTime? dateTime;
  final String? lang;
  final String? image;
  final List<IsarConceptsDto> concepts;
  final List<IsarCategoryDto> categories;

  const IsarArticleDto({
    this.id = Isar.autoIncrement,
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

  ArticleModel toModel() => ArticleModel(
        uuid: uuid,
        title: title,
        url: url,
        body: body,
        isDuplicate: isDuplicate,
        dateTime: dateTime,
        lang: lang,
        image: image,
        sourceId: sourceId,
        concepts: concepts.map((e) => e.toModel()).toList(),
        categories: categories.map((e) => e.toModel()).toList(),
      );
}

@embedded
class IsarConceptsDto {
  String? uri;
  String? type;
  int? score;
  String? label;

  IsarConceptsDto({this.uri, this.type, this.score, this.label});

  Concepts toModel() => Concepts(
        uri: uri,
        type: type,
        score: score,
        label: label,
      );
}

@embedded
class IsarCategoryDto {
  String? uri;
  int? wgt;
  String? label;

  IsarCategoryDto({this.uri, this.wgt, this.label});

  Category toModel() => Category(
        uri: uri,
        wgt: wgt,
        label: label,
      );
}
