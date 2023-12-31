import 'package:isar/isar.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

part 'summary_dto.g.dart';

@collection
@Name('Summary')
class SummaryArticlesDto {
  final Id id;
  final String? name;
  final List<String> articles;
  final List<ArticleResumeDto> resumeArticles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;

  final int dateTime;
  final String? language;
  final int? summaryPercentage;

  SummaryArticlesDto({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.articles = const [],
    this.resumeArticles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.language,
    this.summaryPercentage,
  }) : dateTime = DateTime.now().millisecondsSinceEpoch;

  factory SummaryArticlesDto.fromModel(SummaryArticles model) => SummaryArticlesDto(
        id: model.id ?? Isar.autoIncrement,
        name: model.name,
        articles: model.articles.map((e) => e.uuid).toList(),
        resumeArticles: model.resumeArticles
            .map((model) => ArticleResumeDto(
                  articleId: model.articleId,
                  content: model.content,
                  path: model.path,
                  lang: model.lang,
                ))
            .toList(),
        isCompleted: model.isCompleted,
        isCreatingVoiceSummary: model.isCreatingVoiceSummary,
        language: model.language.value,
        summaryPercentage: model.summaryPercentage,
      );

  SummaryArticles toModel([int? id]) => SummaryArticles(
        id: id ?? this.id,
        name: name,
        isCompleted: isCompleted,
        isCreatingVoiceSummary: isCreatingVoiceSummary,
        language: LanguageEnumX.fromValue(language) ?? LanguageEnum.en,
        summaryPercentage: summaryPercentage ?? 70,
        resumeArticles: resumeArticles
            .map((e) => ArticleResumeModel(
                  articleId: e.articleId,
                  content: e.content,
                  lang: e.lang!,
                  path: e.path,
                ))
            .toList(),
      );

  SummaryArticlesDto copyWith({
    Id? id,
    String? name,
    List<String>? articles,
    List<ArticleResumeDto>? resumeArticles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    String? voiceSummaryPath,
    int? dateTime,
    String? language,
    int? summaryPercentage,
  }) {
    return SummaryArticlesDto(
      id: id ?? this.id,
      name: name ?? this.name,
      articles: articles ?? this.articles,
      resumeArticles: resumeArticles ?? this.resumeArticles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      language: language ?? this.language,
      summaryPercentage: summaryPercentage ?? this.summaryPercentage,
    );
  }
}

@embedded
class ArticleResumeDto {
  final String? articleId;
  final String? content;
  final String? path;
  final String? lang;

  ArticleResumeDto({
    this.articleId,
    this.content,
    this.path,
    this.lang = 'English',
  });

  ArticleResumeModel toModel() => ArticleResumeModel(
        articleId: articleId,
        content: content,
        path: path,
        lang: lang!,
      );
}
