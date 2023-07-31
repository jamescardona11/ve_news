import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

class RemoveArticleUseCase {
  final SummaryRepository _summaryRepository;

  RemoveArticleUseCase(this._summaryRepository);

  Future<void> call(ArticleModel article) async {
    final summary = await _summaryRepository.watchLastUncompleted().first;

    final articles = List<ArticleModel>.from(summary.articles);
    final resumeArticles = List<ArticleResumeModel>.from(summary.resumeArticles);
    articles.remove(article);
    resumeArticles.removeWhere((element) => element.articleId == article.uuid);

    await _summaryRepository.update(
      summary.copyWith(
        articles: articles.toList(),
        resumeArticles: resumeArticles.toList(),
      ),
    );
  }
}
