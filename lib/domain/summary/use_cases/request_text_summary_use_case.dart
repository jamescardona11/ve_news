import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

class RequestTextSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestTextSummaryUseCase(this._summaryRepository);

  Future<ArticleResumeModel?> call(ArticleModel article, String language, int percentage) async {
    final summaryStr = article.summaryStr(percentage);

    final response = await _summaryRepository.sendSummaryRequest(
      ChatGptRequest(
        messages: [
          ChatGptContentMessage(
            content: 'Create a summary\nSummary language: $language\nMaximum output: $summaryStr',
            role: ChatGptRole.system,
          ),
          ChatGptContentMessage(
            content: article.title,
            role: ChatGptRole.user,
          ),
          // ChatGptContentMessage(
          //   content: article.body,
          //   role: ChatGptRole.user,
          // ),
        ],
      ),
    );

    if (response.isRight()) {
      final result = response.toNullable()!;
      if (result.content.isEmpty) return null;
      return ArticleResumeModel(articleId: article.uuid, content: result.content, lang: language);
    }

    return null;
  }
}
