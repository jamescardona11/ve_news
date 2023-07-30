import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ve_news/common/data/preferences_repository_impl.dart';
import 'package:ve_news/common/domain/repository/preferences_repository.dart';
import 'package:ve_news/data/article/articles_repository_impl.dart';
import 'package:ve_news/data/source/sources_repository_impl.dart';
import 'package:ve_news/data/summary/summary_repository_impl.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';
import 'package:ve_news/domain/summary/repository/summary_repository.dart';

@module
abstract class DataModule {
  @LazySingleton(as: PreferencesRepository)
  PreferencesRepositoryImpl get settingsRepository;

  @LazySingleton(as: SourcesRepository, dispose: disposeSourceRepository)
  SourcesRepositoryImpl get sourcesRepository;

  @LazySingleton(as: ArticlesRepository, dispose: disposeArticlesRepository)
  ArticlesRepositoryImpl get articlesRepository;

  @LazySingleton(as: SummaryRepository)
  SummaryRepositoryImpl get summaryRepository;
}

FutureOr<void> disposeSourceRepository(SourcesRepository provider) {
  unawaited(provider.close());
}

FutureOr<void> disposeArticlesRepository(ArticlesRepository provider) {
  unawaited(provider.close());
}
