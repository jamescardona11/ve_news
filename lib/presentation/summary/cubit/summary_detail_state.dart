part of 'summary_detail_cubit.dart';

class SummaryState extends Equatable {
  final List<SummaryArticles> summaries;

  final int? currentPlayingSummaryId;
  final int? currentPlayingArticleId;

  const SummaryState({
    this.summaries = const [],
    this.currentPlayingSummaryId,
    this.currentPlayingArticleId,
  });

  ArticleModel? get currentPlayingArticle =>
      currentPlayingSummary?.articles.firstWhereOrNull((element) => element.id == currentPlayingArticleId);
  SummaryArticles? get currentPlayingSummary => summaries.firstWhereOrNull((element) => element.id == currentPlayingSummaryId);
  bool get notCurrent => currentPlayingSummaryId == null || currentPlayingSummaryId! == -1;

  @override
  List<Object?> get props => [
        summaries,
        currentPlayingSummaryId,
        currentPlayingArticleId,
      ];

  SummaryState copyWith({
    List<SummaryArticles>? summaries,
    int? currentPlayingSummaryId,
    int? currentPlayingArticleId,
  }) {
    return SummaryState(
      summaries: summaries ?? this.summaries,
      currentPlayingSummaryId: currentPlayingSummaryId ?? this.currentPlayingSummaryId,
      currentPlayingArticleId: currentPlayingArticleId ?? this.currentPlayingArticleId,
    );
  }
}
