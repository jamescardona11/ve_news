import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/article_resume_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';
import 'package:ve_news/domain/summary/use_cases/remove_article_use_case.dart';
import 'package:ve_news/domain/summary/use_cases/request_summary_use_case.dart';

part 'new_summary_state.dart';

class NewSummaryCubit extends Cubit<NewSummaryState> {
  final SummaryRepository _summaryRepository;
  final RequestSummaryUseCase _requestSummaryUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  NewSummaryCubit(
    this._summaryRepository,
    this._requestSummaryUseCase,
    this._removeArticleUseCase,
  ) : super(const NewSummaryState()) {
    _init();
  }

  StreamSubscription<SummaryArticles>? _summarySubscription;

  void onChangeSummaryPercentage(int value) {
    emit(state.copyWith(summary: state.summary?.copyWith(summaryPercentage: value)));
  }

  Future<void> onStartSummary() async {
    if (state.summary == null) return;

    final uncompletedArticles = state.summary!.uncompletedArticles;
    if (uncompletedArticles.isNotEmpty) {
      await _onCreateGPTResume(uncompletedArticles);
    }

    await _onElevenLabsVoice();

    emit(state.copyWith(isLoading: false, loadingMessage: ''));
  }

  Future<void> _onElevenLabsVoice() async {}

  Future<void> _onCreateGPTResume(List<ArticleModel> uncompletedArticles) async {
    final language = state.summary!.language.value;
    final summaryPercentage = state.summary!.summaryPercentage;
    final total = state.summary!.articles.length;
    int completed = (total - uncompletedArticles.length);

    _changeLoadingState(completed, total);

    for (var article in uncompletedArticles) {
      final response = await _requestSummaryUseCase.call(article, language, summaryPercentage);
      if (response == null) {
        _changeLoadingState(++completed, total);
        continue;
      }

      final resumeArticles = List<ArticleResumeModel>.from(state.summary!.resumeArticles);
      resumeArticles.add(response);

      final summary = state.summary!.copyWith(resumeArticles: resumeArticles);
      await _summaryRepository.update(summary);

      _changeLoadingState(++completed, total, summary: summary);
    }
  }

  void _changeLoadingState(int completed, int total, {SummaryArticles? summary}) {
    emit(state.copyWith(
      isLoading: true,
      loadingMessage: 'Creating text summary\n $completed/$total completed news',
      summary: summary,
    ));
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
    await _removeArticleUseCase.call(article);
  }
}
