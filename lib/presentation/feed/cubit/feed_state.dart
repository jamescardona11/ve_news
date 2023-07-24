part of 'feed_cubit.dart';

class FeedState extends Equatable {
  final List<SourceModel> sources;
  final List<ArticleModel> articles;

  const FeedState({
    this.sources = const [],
    this.articles = const [],
  });

  @override
  List<Object> get props => [
        sources,
        articles,
      ];

  FeedState copyWith({
    List<SourceModel>? sources,
    List<ArticleModel>? articles,
  }) {
    return FeedState(
      sources: sources ?? this.sources,
      articles: articles ?? this.articles,
    );
  }
}
