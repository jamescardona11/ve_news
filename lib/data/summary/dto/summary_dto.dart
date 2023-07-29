// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'summary_dto.g.dart';

@collection
@Name('Summary')
class SummaryArticlesDto {
  final Id id;
  final List<String> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;
  final int dateTime;

  SummaryArticlesDto({
    this.id = Isar.autoIncrement,
    this.articles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  }) : dateTime = DateTime.now().millisecondsSinceEpoch;

  factory SummaryArticlesDto.fromModel(SummaryArticles model) => SummaryArticlesDto(
        id: model.id ?? Isar.autoIncrement,
        articles: model.articles.map((e) => e.uuid).toList(),
        isCompleted: model.isCompleted,
        isCreatingVoiceSummary: model.isCreatingVoiceSummary,
        voiceSummaryPath: model.voiceSummaryPath,
      );

  SummaryArticles toModel([int? id]) => SummaryArticles(
        id: id ?? this.id,
        isCompleted: isCompleted,
        isCreatingVoiceSummary: isCreatingVoiceSummary,
        voiceSummaryPath: voiceSummaryPath,
      );

  SummaryArticlesDto copyWith({
    Id? id,
    List<String>? articles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    String? voiceSummaryPath,
    int? dateTime,
  }) {
    return SummaryArticlesDto(
      id: id ?? this.id,
      articles: articles ?? this.articles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      voiceSummaryPath: voiceSummaryPath ?? this.voiceSummaryPath,
    );
  }
}
