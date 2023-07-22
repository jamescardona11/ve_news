import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/article_with_source_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';

class WatchArticles {
  final ArticlesRepository _articlesRepository;
  final SourcesRepository _sourcesRepository;

  WatchArticles(this._articlesRepository, this._sourcesRepository);

  Stream<List<ArticleWithSource>> call() {
    return CombineLatestStream.combine2(
      _articlesRepository.watch(),
      _sourcesRepository.watch(),
      (List<ArticleModel> articles, List<SourceModel> sources) => articles
          .map((article) {
            final source = sources.firstWhereOrNull((source) => source.id == article.sourceId);
            if (source == null) return null;
            return ArticleWithSource(article, source);
          })
          .whereNotNull()
          .toList(),
    );
  }
}
