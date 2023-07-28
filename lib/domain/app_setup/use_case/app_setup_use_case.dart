import 'package:ve_news/cross/domain/repository/preferences_repository.dart';
import 'package:ve_news/domain/article/repository/articles_repository.dart';
import 'package:ve_news/domain/source/repository/sources_repository.dart';

final class AppSetupUseCase {
  final PreferencesRepository _preferencesRepository;
  final SourcesRepository _sourcesRepository;
  final ArticlesRepository _articlesRepository;

  AppSetupUseCase(this._preferencesRepository, this._sourcesRepository, this._articlesRepository);

  Future<bool> call() async {
    final isFirstTime = _preferencesRepository.isFirstTime;

    if (!isFirstTime) {
      await _sourcesRepository.createDefaultSources();
      await _preferencesRepository.updateFirstTime();
      await _articlesRepository.fetchTodayArticles();
    }

    return isFirstTime;
  }
}
