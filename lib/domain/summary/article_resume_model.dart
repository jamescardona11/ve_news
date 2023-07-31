class ArticleResumeModel {
  final String? articleId;
  final String? content;
  final String lang;

  ArticleResumeModel({
    this.lang = 'English',
    required this.articleId,
    required this.content,
  });
}
