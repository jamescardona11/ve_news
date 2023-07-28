import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ve_news/core/data/app_shared_preferences.dart';

@module
abstract class CoreModule {
  @singleton
  AppSharedPreferences prefs(SharedPreferences sharedPreferences) {
    return AppSharedPreferences(sharedPreferences);
  }
}
