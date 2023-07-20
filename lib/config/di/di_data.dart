import 'package:injectable/injectable.dart';
import 'package:ve_news/cross/data/preferences_repository_impl.dart';
import 'package:ve_news/cross/domain/repository/preferences_repository.dart';
import 'package:ve_news/data/channel/sources_repository.dart';
import 'package:ve_news/domain/channel/repository/sources_repository.dart';

@module
abstract class DataModule {
  @LazySingleton(as: PreferencesRepository)
  PreferencesRepositoryImpl get settingsRepository;

  @LazySingleton(as: SourcesRepository)
  SourcesRepositoryImpl get sourcesRepository;
}
