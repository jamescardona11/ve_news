import 'package:ve_news/domain/article/article_model.dart';

class ArticleResumeModel {
  final int? id;
  final ArticleModel article;
  final String content;

  ArticleResumeModel({
    this.id,
    required this.article,
    required this.content,
  });
}
