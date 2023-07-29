part of 'articles_cubit.dart';

class ArticlesState extends Equatable {
  final List<SourceModel> sources;
  final List<ArticleModel> articles;
  final SummaryArticles? summary;

  const ArticlesState({
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

  ArticlesState copyWith({
    List<SourceModel>? sources,
    List<ArticleModel>? articles,
    SummaryArticles? summary,
  }) {
    return ArticlesState(
      sources: sources ?? this.sources,
      articles: articles ?? this.articles,
      summary: summary ?? this.summary,
    );
  }
}
