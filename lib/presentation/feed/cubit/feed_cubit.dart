import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/source/source_model.dart';
import 'package:ve_news/domain/summary/summary.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final SourcesRepository _sourcesRepository;
  final ArticlesRepository _articlesRepository;

  FeedCubit(this._sourcesRepository, this._articlesRepository) : super(const FeedState()) {
    _init();
  }

  StreamSubscription<List<SourceModel>>? _sourcesSubscription;
  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  void addArticleToSummary(ArticleModel article) {
    final articles = Set<String>.from(state.summary?.articles ?? <String>{});
    articles.add(article.uuid);

    emit(state.copyWith(summary: SummaryArticles(articles: articles)));
  }

  void removeArticleToSummary(ArticleModel article) {
    final articles = Set<String>.from(state.summary?.articles ?? <String>{});
    articles.remove(article.uuid);

    emit(state.copyWith(summary: SummaryArticles(articles: articles)));
  }

  @override
  Future<void> close() {
    _sourcesSubscription?.cancel();
    _articlesSubscription?.cancel();
    return super.close();
  }

  void _init() {
    _sourcesSubscription = _sourcesRepository.watch().listen((sources) {
      emit(state.copyWith(sources: sources));
    });

    _articlesSubscription = _articlesRepository.watch().listen((articles) {
      emit(state.copyWith(articles: articles));
    });
  }
}
