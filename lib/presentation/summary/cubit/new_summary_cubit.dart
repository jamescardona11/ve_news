import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'new_summary_state.dart';

class NewSummaryCubit extends Cubit<NewSummaryState> {
  final SummaryRepository _summaryRepository;

  NewSummaryCubit(this._summaryRepository) : super(const NewSummaryState()) {
    _init();
  }

  StreamSubscription<SummaryArticles>? _summarySubscription;

  void onChangeSummaryPercentage(int value) {
    emit(state.copyWith(summary: state.summary?.copyWith(summaryPercentage: value)));
  }

  @override
  Future<void> close() {
    _summarySubscription?.cancel();
    return super.close();
  }

  void _init() {
    _summarySubscription = _summaryRepository.watchLastUncompleted().listen((summary) {
      emit(state.copyWith(summary: summary));
    });
  }

  Future<void> removeArticle(ArticleModel article) async {
    final articles = List<ArticleModel>.from(state.summary?.articles ?? <String>[]);
    articles.remove(article);

    final summary = state.summary?.copyWith(articles: articles.toList()) ?? SummaryArticles(articles: articles);
    emit(state.copyWith(summary: summary));
    await _summaryRepository.update(summary);
  }
}
