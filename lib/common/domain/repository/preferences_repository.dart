abstract interface class PreferencesRepository {
  bool get isFirstTime;

  Future<void> updateFirstTime();

  bool get isDarkMode;

  Future<void> updateDarkMode({bool? newState});
}
