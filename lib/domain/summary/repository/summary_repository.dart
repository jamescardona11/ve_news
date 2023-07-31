import 'package:fpdart/fpdart.dart';
import 'package:ve_news/core/errors/app_error.dart';
import 'package:ve_news/domain/summary/chat_gpt_request.dart';
import 'package:ve_news/domain/summary/chat_gpt_response.dart';
import 'package:ve_news/domain/summary/summary.dart';

abstract base class SummaryRepository {
  Stream<List<SummaryArticles>> watch();

  Stream<SummaryArticles> watchLastUncompleted();

  Future<void> complete(SummaryArticles summary);

  Future<void> update(SummaryArticles summary);

  Future<void> delete(int summaryId);

  Future<void> deleteAll();

  Future<Either<AppError, ChatGptResponse>> sendSummaryRequest(ChatGptRequest request);

  Future<Either<AppError, String>> sendVoiceSummaryRequest(String text, {String voiceId = '21m00Tcm4TlvDq8ikWAM'});
}
