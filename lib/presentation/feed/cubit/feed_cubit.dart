import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final SourcesRepository _sourcesRepository;
  final ArticlesRepository _articlesRepository;
  final SummaryRepository _summaryRepository;

  FeedCubit(this._sourcesRepository, this._articlesRepository, this._summaryRepository) : super(const FeedState()) {
    _init();
  }

  StreamSubscription<List<SourceModel>>? _sourcesSubscription;
  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  void addArticleToSummary(ArticleModel article) {
    final articles = Set<String>.from(state.summary?.articles ?? <String>[]);
    articles.add(article.uuid);

    _updateSummary(articles);
  }

  void removeArticleToSummary(ArticleModel article) {
    final articles = Set<String>.from(state.summary?.articles ?? <String>[]);
    articles.remove(article.uuid);

    _updateSummary(articles);
  }

  void _updateSummary(Set<String> articles) {
    // final summary = state.summary?.copyWith(articles: articles.to) ?? SummaryArticles(articles: articles);
    // emit(state.copyWith(summary: summary));
    // _summaryRepository.update(summary);
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

    _articlesSubscription = _articlesRepository.watch().listen((articles) {
      emit(state.copyWith(articles: articles));
    });
  }
}
