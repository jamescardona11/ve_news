part of 'feed_cubit.dart';

class FeedState extends Equatable {
  final List<SourceModel> sources;
  final List<ArticleModel> articles;
  final SummaryArticles? summary;

  const FeedState({
    this.sources = const [],
    this.articles = const [],
    this.summary,
  });

  @override
  List<Object?> get props => [
        sources,
        articles,
        summary,
      ];

  FeedState copyWith({
    List<SourceModel>? sources,
    List<ArticleModel>? articles,
    SummaryArticles? summary,
  }) {
    return FeedState(
      sources: sources ?? this.sources,
      articles: articles ?? this.articles,
      summary: summary ?? this.summary,
    );
  }
}
