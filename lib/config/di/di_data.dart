import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/cross/data/preferences_repository_impl.dart';
import 'package:ve_news/cross/domain/repository/preferences_repository.dart';
import 'package:ve_news/data/article/articles_repository_impl.dart';
import 'package:ve_news/data/source/sources_repository_impl.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';

@module
abstract class DataModule {
  @LazySingleton(as: PreferencesRepository)
  PreferencesRepositoryImpl get settingsRepository;

  @LazySingleton(as: SourcesRepository, dispose: disposeRepository)
  SourcesRepositoryImpl get sourcesRepository;

  @LazySingleton(as: ArticlesRepository, dispose: disposeRepository)
  ArticlesRepositoryImpl get articlesRepository;
}

FutureOr<void> disposeRepository(BaseSubscriptionMixin provider) {
  unawaited(provider.close());
}
