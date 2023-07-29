import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/domain/article/article_model.dart';

abstract base class ArticlesRepository with BaseSubscriptionMixin {
  Future<void> fetchTodayArticles();

  Future<void> fetchNewArticles();

  Stream<List<ArticleModel>> watch();

  Future<List<ArticleModel>> readByIds(List<String> ids);

  Future<void> removeOldArticles();
}
