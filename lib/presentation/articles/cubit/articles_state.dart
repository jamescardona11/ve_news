part of 'articles_cubit.dart';

class ArticlesState extends Equatable {
  final List<SourceModel> sources;
  final List<ArticleModel> articles;
  final List<ArticleModel> bookmarks;
  final SummaryArticles? summary;

  const ArticlesState({
    this.sources = const [],
    this.articles = const [],
    this.bookmarks = const [],
    this.summary,
  });

  @override
  List<Object?> get props => [
        sources,
        articles,
        bookmarks,
        summary,
      ];

  ArticlesState copyWith({
    List<SourceModel>? sources,
    List<ArticleModel>? articles,
    List<ArticleModel>? bookmarks,
    SummaryArticles? summary,
  }) {
    return ArticlesState(
      sources: sources ?? this.sources,
      articles: articles ?? this.articles,
      bookmarks: bookmarks ?? this.bookmarks,
      summary: summary ?? this.summary,
    );
  }
}
