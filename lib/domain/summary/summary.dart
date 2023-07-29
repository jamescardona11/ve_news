import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';

class SummaryArticles extends Equatable {
  final int? id;
  final List<ArticleModel> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;

  const SummaryArticles({
    this.id,
    this.articles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  });

  SummaryArticles copyWith({
    int? id,
    List<ArticleModel>? articles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    String? voiceSummaryPath,
  }) =>
      SummaryArticles(
        id: id ?? this.id,
        articles: articles ?? this.articles,
        isCompleted: isCompleted ?? this.isCompleted,
        isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
        voiceSummaryPath: voiceSummaryPath ?? this.voiceSummaryPath,
      );

  @override
  List<Object?> get props => [
        id,
        articles,
      ];
}
