import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';
import 'package:ve_news/domain/summary/use_cases/remove_article_use_case.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final SourcesRepository _sourcesRepository;
  final ArticlesRepository _articlesRepository;
  final SummaryRepository _summaryRepository;
  final RemoveArticleUseCase _removeArticleUseCase;

  ArticlesCubit(
    this._sourcesRepository,
    this._articlesRepository,
    this._summaryRepository,
    this._removeArticleUseCase, {
    SourceModel? sourceFilter,
  }) : super(const ArticlesState()) {
    _init(sourceFilter);
  }

  StreamSubscription<List<SourceModel>>? _sourcesSubscription;
  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  Future<void> saveToBookMarks(ArticleModel article) => _articlesRepository.update(article.copyWith(bookmark: true));

  void addArticleToSummary(ArticleModel article) {
    final articles = List<ArticleModel>.from(state.summary?.articles ?? <String>[]);
    articles.add(article);

    _updateSummary(articles);
  }

  Future<void> removeArticleToSummary(ArticleModel article) async {
    await _removeArticleUseCase.call(article);
  }

  Future<void> _updateSummary(List<ArticleModel> articles) async {
    final summary = state.summary?.copyWith(articles: articles.toList()) ?? SummaryArticles(articles: articles);
    emit(state.copyWith(summary: summary));
    await _summaryRepository.update(summary);
  }

  @override
  Future<void> close() {
    _sourcesSubscription?.cancel();
    _articlesSubscription?.cancel();
    return super.close();
  }

  void _init(SourceModel? sourceFilter) {
    _summaryRepository.watchLastUncompleted().listen((summary) {
      emit(state.copyWith(summary: summary));
    });

    _sourcesSubscription = _sourcesRepository.watch().listen((sources) {
      emit(state.copyWith(sources: sources));
    });

    _articlesSubscription = _articlesRepository.watchBookmarks().listen((articles) {
      emit(state.copyWith(bookmarks: articles));
    });

    _articlesSubscription = _articlesRepository.watch().listen((articles) {
      if (sourceFilter == null) {
        emit(state.copyWith(articles: articles));
        return;
      }

      final filteredArticles = articles.where((article) => article.source.id == sourceFilter.id).toList();
      emit(state.copyWith(articles: filteredArticles));
    });
  }
}
