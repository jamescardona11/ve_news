import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/domain/article/article_model.dart';

abstract base class ArticlesRepository with BaseSubscriptionMixin {
  Future<void> readNewArticles();

  Stream<List<ArticleModel>> watch();

  Future<void> removeAllArticles();
}
