import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';

class SummaryArticles extends Equatable {
  final int? id;
  final List<ArticleModel> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final int summaryPercentage;
  final String? voiceSummaryPath;

  const SummaryArticles({
    this.id,
    this.articles = const [],
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.summaryPercentage = 90,
    this.voiceSummaryPath,
  });

  bool get isEmpty => articles.isEmpty;
  List<Category> get categories => articles.map((e) => e.categories.isNotEmpty ? e.categories.first : null).whereNotNull().toSet().toList();

  int get length => articles.length;
  int get bodyLength => articles.map((e) => e.body.length).fold(0, (previousValue, element) => previousValue + element);

  SummaryArticles copyWith({
    int? id,
    List<ArticleModel>? articles,
    bool? isCompleted,
    bool? isCreatingVoiceSummary,
    int? summaryPercentage,
    String? voiceSummaryPath,
  }) {
    return SummaryArticles(
      id: id ?? this.id,
      articles: articles ?? this.articles,
      isCompleted: isCompleted ?? this.isCompleted,
      isCreatingVoiceSummary: isCreatingVoiceSummary ?? this.isCreatingVoiceSummary,
      summaryPercentage: summaryPercentage ?? this.summaryPercentage,
      voiceSummaryPath: voiceSummaryPath ?? this.voiceSummaryPath,
    );
  }

  @override
  List<Object?> get props => [
        id,
        articles,
        isCompleted,
        isCreatingVoiceSummary,
        summaryPercentage,
        voiceSummaryPath,
      ];
}
