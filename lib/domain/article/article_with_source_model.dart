import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/source/source_model.dart';

class ArticleWithSource {
  final ArticleModel article;
  final SourceModel source;

  ArticleWithSource(this.article, this.source);
}
