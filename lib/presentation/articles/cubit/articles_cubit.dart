import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final SourcesRepository _sourcesRepository;
  final ArticlesRepository _articlesRepository;
  final SummaryRepository _summaryRepository;

  ArticlesCubit(this._sourcesRepository, this._articlesRepository, this._summaryRepository) : super(const ArticlesState()) {
    _init();
  }

  StreamSubscription<List<SourceModel>>? _sourcesSubscription;
  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  Future<void> saveToBookMarks(ArticleModel article) => _articlesRepository.update(article);

  void addArticleToSummary(ArticleModel article) {
    final articles = List<ArticleModel>.from(state.summary?.articles ?? <String>[]);
    articles.add(article);

    _updateSummary(articles);
  }

  void removeArticleToSummary(ArticleModel article) {
    final articles = List<ArticleModel>.from(state.summary?.articles ?? <String>[]);
    articles.remove(article);

    _updateSummary(articles);
  }

  void _updateSummary(List<ArticleModel> articles) {
    final summary = state.summary?.copyWith(articles: articles.toList()) ?? SummaryArticles(articles: articles);
    emit(state.copyWith(summary: summary));
    _summaryRepository.update(summary);
  }

  @override
  Future<void> close() {
    _sourcesSubscription?.cancel();
    _articlesSubscription?.cancel();
    return super.close();
  }

  void _init() {
    _summaryRepository.watchLastUncompleted().listen((summary) {
      emit(state.copyWith(summary: summary));
    });

    _sourcesSubscription = _sourcesRepository.watch().listen((sources) {
      emit(state.copyWith(sources: sources));
    });

    _articlesSubscription = _articlesRepository.watchBookmarks().listen((articles) {
      emit(state.copyWith(articles: articles));
    });

    _articlesSubscription = _articlesRepository.watch().listen((articles) {
      emit(state.copyWith(articles: articles));
    });
  }
}
