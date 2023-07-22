import 'package:ve_news/cross/domain/repository/preferences_repository.dart';
import 'package:ve_news/domain/channel/repository/sources_repository.dart';

final class AppSetupUseCase {
  final PreferencesRepository _preferencesRepository;
  final SourcesRepository _sourcesRepository;

  AppSetupUseCase(this._preferencesRepository, this._sourcesRepository);

  Future<bool> call() async {
    final isFirstTime = _preferencesRepository.isFirstTime;

    if (isFirstTime) {
      await _sourcesRepository.createDefaultSources();
      await _preferencesRepository.updateFirstTime();
    }

    return isFirstTime;
  }
}
