import 'package:ve_news/domain/summary/summary.dart';

abstract base class SummaryRepository {
  Stream<List<SummaryArticles>> watch();

  Future<SummaryArticles> readLastUncompletedOrNew();

  Future<void> update(SummaryArticles summary);

  Future<void> delete(int summaryId);

  Future<void> deleteAll();
}
