import 'dart:async';

import 'package:collection/collection.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

class RequestVoiceSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestVoiceSummaryUseCase(this._summaryRepository);

  Stream<int> call(SummaryArticles summary) {
    late StreamController<int> streamController;

    streamController = StreamController<int>(
      onListen: () async {
        SummaryArticles newSummary = summary.copyWith();
        for (var i = 0; i < summary.resumeArticles.length; i++) {
          final path = await _request(summary, summary.resumeArticles[i]);

          if (path != null) {
            final resumeArticles = List<ArticleResumeModel>.from(newSummary.resumeArticles);
            resumeArticles[i] = resumeArticles[i].copyWith(path: path);

            newSummary = newSummary.copyWith(resumeArticles: resumeArticles);
            await _summaryRepository.update(newSummary);
          }

          streamController.add(i);
        }

        await streamController.close();
      },
    );

    return streamController.stream;
  }

  Future<String?> _request(SummaryArticles summary, ArticleResumeModel resume) async {
    String text = '';
    final articleTitle = summary.articles.firstWhereOrNull((element) => element.uuid == resume.articleId)?.title;

    if (articleTitle != null) {
      text += '$articleTitle - \n';
      text += '${resume.content} - \n';
    }

    final response = await _summaryRepository.sendVoiceSummaryRequest(text);

    return response.fold((l) => null, (r) => r);
  }
}
