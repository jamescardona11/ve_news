import 'package:ve_news/domain/summary/article_resume_model.dart';
import 'package:ve_news/domain/summary/chat_gpt_request.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

class RequestSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestSummaryUseCase(this._summaryRepository);

  Future<void> call(SummaryArticles summary) async {
    final List<ArticleResumeModel> resumeArticles = [];

    for (var article in summary.articles) {
      final response = await _summaryRepository.sendQuestion(
        ChatGptRequest(
          messages: [
            ChatGptContentMessage(
              content: 'Create a summary\nSummary language: ${summary.language.value}\nMaximum output: ${summary.summaryStr}',
              role: ChatGptRole.system,
            ),
            ChatGptContentMessage(
              content: article.body,
              role: ChatGptRole.user,
            ),
          ],
        ),
      );

      if (response.isRight()) {}
    }
  }
}
