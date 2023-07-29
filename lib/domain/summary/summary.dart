import 'package:equatable/equatable.dart';
import 'package:ve_news/config/constants.dart';

class SummaryArticles extends Equatable {
  final int id;
  final Set<String> articles;
  final bool isCompleted;
  final bool isCreatingVoiceSummary;
  final String? voiceSummaryPath;

  const SummaryArticles({
    this.id = Constants.fakeId,
    this.articles = const {},
    this.isCompleted = false,
    this.isCreatingVoiceSummary = false,
    this.voiceSummaryPath,
  });

  SummaryArticles copyWith({
    int? id,
    Set<String>? articles,
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
