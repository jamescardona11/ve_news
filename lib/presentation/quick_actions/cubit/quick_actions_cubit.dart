import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

part 'quick_actions_state.dart';

class QuickActionsCubit extends Cubit<QuickActionsState> {
  final ArticlesRepository _articlesRepository;
  final SummaryRepository _summaryRepository;
  final RequestTextSummaryUseCase _requestTextSummaryUseCase;
  final RequestVoiceSummaryUseCase _requestVoiceSummaryUseCase;

  QuickActionsCubit(
    this._articlesRepository,
    this._summaryRepository,
    this._requestTextSummaryUseCase,
    this._requestVoiceSummaryUseCase,
  ) : super(QuickActionsState()) {
    _init();
  }

  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  Future<void> onTemp10MinutesNews() async {
    final articles = state.articles.take(4).toList();
    final summary = await _summaryRepository.createNamed('10 Minutes', articles);

    await onStartSummary(summary);
  }

  Future<void> onTemp5TheGuardianNews() async {
    final articles = state.articles.where((element) => element.source.url == 'theguardian.com').take(5).toList();
    final summary = await _summaryRepository.createNamed('5 The Guardian', articles);

    await onStartSummary(summary);
  }

  Future<void> onTemp5SportsNews() async {
    final articles =
        state.articles.where((element) => element.categories.any((element) => element.singleLabel == 'Sports')).take(5).toList();
    final summary = await _summaryRepository.createNamed('5 Sports', articles);

    await onStartSummary(summary);
  }

  Future<void> onStartSummary(SummaryArticles summary) async {
    final uncompletedArticles = summary.uncompletedTextArticles;
    if (uncompletedArticles.isNotEmpty) {
      await _onCreateGPTResume(summary, uncompletedArticles);
    }

    await _onElevenLabsVoice(summary);
  }

  Future<void> _onElevenLabsVoice(SummaryArticles summary) async {
    final uncompletedArticles = summary.uncompletedVoiceSummaries;
    final total = summary.articles.length;
    int completed = (total - uncompletedArticles.length);

    _changeLoadingState(kind: 'Voice', completed: ++completed, total: total);

    _requestVoiceSummaryUseCase.call(summary).listen((event) {
      _changeLoadingState(kind: 'Voice', completed: ++completed, total: total);
    }).onDone(() async {
      await _summaryRepository.complete();

      emit(state.copyWith(isLoading: false, loadingMessage: ''));
    });
  }

  Future<void> _onCreateGPTResume(SummaryArticles summary, List<ArticleModel> uncompletedArticles) async {
    final language = summary.language.value;
    final summaryPercentage = summary.summaryPercentage;
    final total = summary.articles.length;
    int completed = (total - uncompletedArticles.length);

    _changeLoadingState(completed: completed, total: total);

    for (var article in uncompletedArticles) {
      final response = await _requestTextSummaryUseCase.call(article, language, summaryPercentage);
      if (response == null) {
        _changeLoadingState(completed: ++completed, total: total);
        continue;
      }

      final resumeArticles = List<ArticleResumeModel>.from(summary.resumeArticles);
      resumeArticles.add(response);

      await _summaryRepository.update(summary.copyWith(resumeArticles: resumeArticles));

      _changeLoadingState(completed: ++completed, total: total);
    }
  }

  void _changeLoadingState({
    required int completed,
    required int total,
    String kind = 'Text',
  }) {
    emit(state.copyWith(
      isLoading: true,
      loadingMessage: 'Creating $kind summary\n $completed/$total completed news',
    ));
  }

  @override
  Future<void> close() {
    _articlesSubscription?.cancel();
    return super.close();
  }

  void _init() {
    _articlesSubscription = _articlesRepository.watch().listen((articles) {
      emit(state.copyWith(articles: articles));
    });
  }
}
