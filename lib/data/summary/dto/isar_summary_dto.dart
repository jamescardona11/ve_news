import 'package:isar/isar.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'isar_summary_dto.g.dart';

@collection
@Name('Summary')
final class IsarSummaryArticlesDto {
  final Id id;
  final List<String> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;
  final int dateTime;

  IsarSummaryArticlesDto({
    this.id = Isar.autoIncrement,
    this.articles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  }) : dateTime = DateTime.now().millisecondsSinceEpoch;

  factory IsarSummaryArticlesDto.fromModel(SummaryArticles model) => IsarSummaryArticlesDto(
        id: model.id,
        articles: model.articles.toList(),
        isCompleted: model.isCompleted,
        isCreatingVoiceSummary: model.isCreatingVoiceSummary,
        voiceSummaryPath: model.voiceSummaryPath,
      );

  SummaryArticles toModel([int? id]) => SummaryArticles(
        id: id ?? this.id,
        articles: Set.from(articles),
        isCompleted: isCompleted,
        isCreatingVoiceSummary: isCreatingVoiceSummary,
        voiceSummaryPath: voiceSummaryPath,
      );
}
