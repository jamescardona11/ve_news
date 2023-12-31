import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/domain/article/article_model.dart';

abstract base class ArticlesRepository with BaseSubscriptionMixin {
  Future<void> fetchTodayArticles();

  Future<void> fetchNewArticles();

  Stream<List<ArticleModel>> watch();

  Stream<List<ArticleModel>> watchBookmarks();

  Future<List<ArticleModel>> readByIds(List<String> ids);

  Future<void> update(ArticleModel article);

  Future<void> removeOldArticles();
}
