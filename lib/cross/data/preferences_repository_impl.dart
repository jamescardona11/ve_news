import 'package:ve_news/config/constants.dart';
import 'package:ve_news/core/data/data.dart';
import 'package:ve_news/cross/domain/repository/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final AppSharedPreferences _appSharedPreferences;

  PreferencesRepositoryImpl(this._appSharedPreferences);

  @override
  bool get isFirstTime => _appSharedPreferences.readBool(Constants.isFirstTimeKey) ?? false;

  @override
  Future<void> updateFirstTime() {
    return _appSharedPreferences.set(Constants.isFirstTimeKey, true);
  }

  @override
  bool get isDarkMode => _appSharedPreferences.readBool(Constants.isDarkModeKey) ?? false;

  @override
  Future<void> updateDarkMode({bool? newState}) {
    final current = _appSharedPreferences.readBool(Constants.isDarkModeKey) ?? false;
    return _appSharedPreferences.set(Constants.isDarkModeKey, newState ?? !current);
  }
}
