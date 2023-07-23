// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i6;
import 'package:projectile/projectile.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:ve_news/config/di/di_core.dart' as _i19;
import 'package:ve_news/config/di/di_data.dart' as _i12;
import 'package:ve_news/config/di/di_external.dart' as _i4;
import 'package:ve_news/config/di/di_presentation.dart' as _i17;
import 'package:ve_news/config/di/di_use_cases.dart' as _i18;
import 'package:ve_news/core/data/app_shared_preferences.dart' as _i9;
import 'package:ve_news/core/data/data.dart' as _i21;
import 'package:ve_news/cross/data/connectivity_provider.dart' as _i3;
import 'package:ve_news/cross/data/preferences_repository_impl.dart' as _i20;
import 'package:ve_news/cross/domain/repository/preferences_repository.dart'
    as _i10;
import 'package:ve_news/cross/domain/use_cases/use_cases.dart' as _i5;
import 'package:ve_news/data/article/articles_repository_impl.dart' as _i23;
import 'package:ve_news/data/source/sources_repository_impl.dart' as _i22;
import 'package:ve_news/domain/app_setup/use_case/app_setup_use_case.dart'
    as _i15;
import 'package:ve_news/domain/article/repository/articles_repository.dart'
    as _i13;
import 'package:ve_news/domain/source/repository/sources_repository.dart'
    as _i11;
import 'package:ve_news/presentation/feed/cubit/feed_cubit.dart' as _i14;
import 'package:ve_news/presentation/intro/cubit/intro_cubit.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalModule = _$ExternalModule();
    final useCasesModule = _$UseCasesModule(this);
    final coreModule = _$CoreModule();
    final dataModule = _$DataModule(this);
    final presentationModule = _$PresentationModule(this);
    gh.singleton<_i3.ConnectivityProvider>(
      externalModule.connectivityProvider,
      dispose: _i4.disposeProvider,
    );
    gh.singleton<_i5.HasInternetConnectionUseCase>(
        useCasesModule.hasInternetConnection);
    gh.factory<List<_i6.CollectionSchema<dynamic>>>(
      () => externalModule.isarSchemas,
      instanceName: 'IsarSchemas',
    );
    gh.singleton<_i7.Projectile>(externalModule.projectile());
    await gh.singletonAsync<_i8.SharedPreferences>(
      () => externalModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i5.WatchInternetConnectionUseCase>(
        useCasesModule.watchInternetConnection);
    gh.singleton<_i9.AppSharedPreferences>(
        coreModule.prefs(gh<_i8.SharedPreferences>()));
    await gh.singletonAsync<_i6.Isar>(
      () => externalModule.startIsar(
          gh<List<_i6.CollectionSchema<dynamic>>>(instanceName: 'IsarSchemas')),
      preResolve: true,
    );
    gh.lazySingleton<_i10.PreferencesRepository>(
        () => dataModule.settingsRepository);
    gh.lazySingleton<_i11.SourcesRepository>(
      () => dataModule.sourcesRepository,
      dispose: _i12.disposeSourceRepository,
    );
    gh.lazySingleton<_i13.ArticlesRepository>(
      () => dataModule.articlesRepository,
      dispose: _i12.disposeArticlesRepository,
    );
    gh.factory<_i14.FeedCubit>(() => presentationModule.feedCubit);
    gh.singleton<_i15.AppSetupUseCase>(useCasesModule.appSetupUseCase);
    gh.factory<_i16.IntroCubit>(() => presentationModule.introCubit);
    return this;
  }
}

class _$PresentationModule extends _i17.PresentationModule {
  _$PresentationModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i16.IntroCubit get introCubit =>
      _i16.IntroCubit(_getIt<_i15.AppSetupUseCase>());
  @override
  _i14.FeedCubit get feedCubit =>
      _i14.FeedCubit(_getIt<_i11.SourcesRepository>());
}

class _$UseCasesModule extends _i18.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.HasInternetConnectionUseCase get hasInternetConnection =>
      _i5.HasInternetConnectionUseCase(_getIt<_i3.ConnectivityProvider>());
  @override
  _i5.WatchInternetConnectionUseCase get watchInternetConnection =>
      _i5.WatchInternetConnectionUseCase(_getIt<_i3.ConnectivityProvider>());
  @override
  _i15.AppSetupUseCase get appSetupUseCase => _i15.AppSetupUseCase(
        _getIt<_i10.PreferencesRepository>(),
        _getIt<_i11.SourcesRepository>(),
        _getIt<_i13.ArticlesRepository>(),
      );
}

class _$ExternalModule extends _i4.ExternalModule {}

class _$CoreModule extends _i19.CoreModule {}

class _$DataModule extends _i12.DataModule {
  _$DataModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i20.PreferencesRepositoryImpl get settingsRepository =>
      _i20.PreferencesRepositoryImpl(_getIt<_i21.AppSharedPreferences>());
  @override
  _i22.SourcesRepositoryImpl get sourcesRepository =>
      _i22.SourcesRepositoryImpl(_getIt<_i6.Isar>());
  @override
  _i23.ArticlesRepositoryImpl get articlesRepository =>
      _i23.ArticlesRepositoryImpl(
        _getIt<_i6.Isar>(),
        _getIt<_i7.Projectile>(),
        _getIt<_i11.SourcesRepository>(),
      );
}
