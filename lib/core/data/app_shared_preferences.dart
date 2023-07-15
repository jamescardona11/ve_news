import 'package:shared_preferences/shared_preferences.dart';

import '../errors/app_error.dart';

// Base in https://github.com/jamescardona11/starter_kit_flutter/blob/main/pocket/lib/src/adapter/mixin_pocket_cache.dart
class AppSharedPreferences {
  const AppSharedPreferences(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  Future<bool> set<D>(String key, D data) async {
    if (data is bool) {
      return sharedPreferences.setBool(key, data);
    } else if (data is double) {
      return sharedPreferences.setDouble(key, data);
    } else if (data is int) {
      return sharedPreferences.setInt(key, data);
    } else if (data is String) {
      return sharedPreferences.setString(key, data);
    } else {
      throw UnexpectedError();
    }
  }

  Future<void> delete(String id) => sharedPreferences.remove(id);

  bool? readBool(String id) {
    return sharedPreferences.getBool(id);
  }

  int? readInt(String id) {
    return sharedPreferences.getInt(id);
  }

  double? readDouble(String id) {
    return sharedPreferences.getDouble(id);
  }

  String? readString(String id) {
    return sharedPreferences.getString(id);
  }

  Future<void> clean() => sharedPreferences.clear();
}
