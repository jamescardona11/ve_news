import 'package:isar/isar.dart';
import 'package:ve_news/domain/summary/article_resume_model.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'summary_dto.g.dart';

@collection
@Name('Summary')
class SummaryArticlesDto {
  final Id id;
  final List<String> articles;
  final List<ArticleResumeDto> resumeArticles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;
  final int dateTime;

  SummaryArticlesDto({
    this.id = Isar.autoIncrement,
    this.articles = const [],
    this.resumeArticles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  }) : dateTime = DateTime.now().millisecondsSinceEpoch;

  factory SummaryArticlesDto.fromModel(SummaryArticles model) => SummaryArticlesDto(
        id: model.id ?? Isar.autoIncrement,
        articles: model.articles.map((e) => e.uuid).toList(),
        resumeArticles: model.resumeArticles.map((model) => ArticleResumeDto(articleId: model.articleId, content: model.content)).toList(),
        isCompleted: model.isCompleted,
        isCreatingVoiceSummary: model.isCreatingVoiceSummary,
        voiceSummaryPath: model.voiceSummaryPath,
      );

  SummaryArticles toModel([int? id]) => SummaryArticles(
        id: id ?? this.id,
        isCompleted: isCompleted,
        isCreatingVoiceSummary: isCreatingVoiceSummary,
        voiceSummaryPath: voiceSummaryPath,
        resumeArticles: resumeArticles.map((e) => ArticleResumeModel(articleId: e.articleId, content: e.content)).toList(),
      );

  SummaryArticlesDto copyWith({
    Id? id,
    List<String>? articles,
    List<ArticleResumeDto>? resumeArticles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    String? voiceSummaryPath,
    int? dateTime,
  }) {
    return SummaryArticlesDto(
      id: id ?? this.id,
      articles: articles ?? this.articles,
      resumeArticles: resumeArticles ?? this.resumeArticles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      voiceSummaryPath: voiceSummaryPath ?? this.voiceSummaryPath,
    );
  }
}

@embedded
class ArticleResumeDto {
  final String? articleId;
  final String? content;
  final String? lang;

  ArticleResumeDto({
    this.articleId,
    this.content,
    this.lang = 'English',
  });
}
