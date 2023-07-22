import 'package:ve_news/domain/article/article_model.dart';

abstract interface class ArticlesRepository {
  Future<void> readNewArticles();

  Stream<List<ArticleModel>> watch();

  Future<void> removeAllArticles();
}
