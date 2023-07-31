import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/article_resume_model.dart';
import 'package:ve_news/domain/summary/chat_gpt_request.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';

class RequestSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestSummaryUseCase(this._summaryRepository);

  Future<ArticleResumeModel?> call(ArticleModel article, String language, int percentage) async {
    final summaryStr = article.summaryStr(percentage);

    final response = await _summaryRepository.sendQuestion(
      ChatGptRequest(
        messages: [
          ChatGptContentMessage(
            content: 'Create a summary\nSummary language: $language\nMaximum output: $summaryStr',
            role: ChatGptRole.system,
          ),
          ChatGptContentMessage(
            content: article.body,
            role: ChatGptRole.user,
          ),
        ],
      ),
    );

    if (response.isRight()) {
      final result = response.toNullable()!;
      if (result.content.isEmpty) return null;
      return ArticleResumeModel(articleId: article.uuid, content: result.content);
    }

    return null;
  }
}
