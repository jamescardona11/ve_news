import 'package:fpdart/fpdart.dart';
import 'package:ve_news/core/errors/app_error.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

abstract base class SummaryRepository {
  Stream<List<SummaryArticles>> watch();

  Stream<SummaryArticles> watchLastUncompleted();

  Future<SummaryArticles> createNamed(String name, List<ArticleModel> articles);

  Future<void> complete();

  Future<void> update(SummaryArticles summary);

  Future<void> delete(int summaryId);

  Future<void> deleteAll();

  Future<Either<AppError, ChatGptResponse>> sendSummaryRequest(ChatGptRequest request);

  Future<Either<AppError, String>> sendVoiceSummaryRequest(String text, {String voiceId = '21m00Tcm4TlvDq8ikWAM'});

  Future<void> createPending();
}
