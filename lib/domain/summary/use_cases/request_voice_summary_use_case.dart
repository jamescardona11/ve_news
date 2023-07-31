import 'package:collection/collection.dart';
import 'package:ve_news/domain/summary/export_summary.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';

class RequestVoiceSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestVoiceSummaryUseCase(this._summaryRepository);

  Future<String?> call(SummaryArticles summary) async {
    String text = '${_firstNews(summary.language)}\n';
    for (var i = 0; i < summary.resumeArticles.length; i++) {
      final resume = summary.resumeArticles[i];
      final articleTitle = summary.articles.firstWhereOrNull((element) => element.uuid == resume.articleId)?.title;

      if (articleTitle != null) {
        text += '$articleTitle - \n';
        text += '${resume.content} - \n';

        if (i < summary.resumeArticles.length - 1) {
          text += '${_nextNews(summary.language)}\n';
        }
      }
    }

    final response = await _summaryRepository.sendVoiceSummaryRequest(text);

    return response.fold((l) => null, (r) => r);
  }

  String _nextNews(LanguageEnum languageEnum) {
    switch (languageEnum) {
      case LanguageEnum.en:
        return 'Next news';
      case LanguageEnum.fr:
        return 'Nouvelle suivante';
      case LanguageEnum.es:
        return 'Siguiente noticia';
      case LanguageEnum.de:
        return 'Nächste Nachricht';
      case LanguageEnum.it:
        return 'Prossima notizia';

      default:
        return 'Próxima notícia';
    }
  }

  String _firstNews(LanguageEnum languageEnum) {
    switch (languageEnum) {
      case LanguageEnum.en:
        return 'First news';
      case LanguageEnum.fr:
        return 'Première nouvelle';
      case LanguageEnum.es:
        return 'Primera noticia';
      case LanguageEnum.de:
        return 'Erste Nachricht';
      case LanguageEnum.it:
        return 'Prima notizia';

      default:
        return 'Primeira notícia';
    }
  }
}
