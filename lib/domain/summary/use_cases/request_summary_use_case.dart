import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

class RequestSummaryUseCase {
  final SummaryRepository _summaryRepository;

  RequestSummaryUseCase(this._summaryRepository);

  Future<void> call(SummaryModel summary) async {
    for (var article in summary.articles) {}
  }
}
