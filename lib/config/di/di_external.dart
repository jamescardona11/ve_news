import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectile/projectile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ve_news/cross/data/connectivity_provider.dart';
import 'package:ve_news/data/article/dto/isar_article_dto.dart';
import 'package:ve_news/data/source/dto/isar_source_dto.dart';

@module
abstract class ExternalModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @singleton
  Projectile projectile() => Projectile(client: HttpClient(config: const BaseConfig(enableLog: false)));

  @Named('IsarSchemas')
  List<CollectionSchema> get isarSchemas => [
        IsarSourceDtoSchema,
        IsarArticleDtoSchema,
      ];

  @singleton
  @preResolve
  Future<Isar> startIsar(@Named('IsarSchemas') List<CollectionSchema> schemas) async {
    final dir = await getApplicationDocumentsDirectory();

    return Isar.open(
      schemas,
      directory: dir.path,
      inspector: true,
      name: 've_news_v2',
    );
  }

  @Singleton(dispose: disposeProvider)
  ConnectivityProvider get connectivityProvider => ConnectivityProvider();
}

FutureOr<void> disposeProvider(ConnectivityProvider provider) {
  unawaited(provider.close());
}
