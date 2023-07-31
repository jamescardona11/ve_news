import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';

part 'quick_actions_state.dart';

class QuickActionsCubit extends Cubit<QuickActionsState> {
  final ArticlesRepository _articlesRepository;

  QuickActionsCubit(this._articlesRepository) : super(QuickActionsState()) {
    _init();
  }

  StreamSubscription<List<ArticleModel>>? _articlesSubscription;

  Future<void> onTemp10MinutesNews() async {
    final articles = state.articles.take(4);
  }

  Future<void> onTemp5TheGuardianNews() async {
    final articles = state.articles.where((element) => element.source.url == 'theguardian.com').take(5);
  }

  Future<void> onTemp5SportsNews() async {
    final articles = state.articles.where((element) => element.categories.any((element) => element.singleLabel == 'Sports')).take(5);
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
