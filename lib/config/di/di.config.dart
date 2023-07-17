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
import 'package:isar/isar.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:ve_news/config/di/di_core.dart' as _i12;
import 'package:ve_news/config/di/di_data.dart' as _i13;
import 'package:ve_news/config/di/di_external.dart' as _i5;
import 'package:ve_news/config/di/di_use_cases.dart' as _i11;
import 'package:ve_news/core/data/app_shared_preferences.dart' as _i9;
import 'package:ve_news/core/data/data.dart' as _i15;
import 'package:ve_news/cross/data/connectivity_provider.dart' as _i4;
import 'package:ve_news/cross/data/preferences_repository_impl.dart' as _i14;
import 'package:ve_news/cross/domain/repository/preferences_repository.dart'
    as _i10;
import 'package:ve_news/cross/domain/use_cases/use_cases.dart' as _i6;
import 'package:ve_news/domain/app_setup/use_case/app_setup_use_case.dart'
    as _i3;

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
    final useCasesModule = _$UseCasesModule(this);
    final externalModule = _$ExternalModule();
    final coreModule = _$CoreModule();
    final dataModule = _$DataModule(this);
    gh.singleton<_i3.AppSetupUseCase>(useCasesModule.appSetupUseCase);
    gh.singleton<_i4.ConnectivityProvider>(
      externalModule.connectivityProvider,
      dispose: _i5.disposeProvider,
    );
    gh.singleton<_i6.HasInternetConnectionUseCase>(
        useCasesModule.hasInternetConnection);
    gh.factory<List<_i7.CollectionSchema<dynamic>>>(
      () => externalModule.isarSchemas,
      instanceName: 'IsarSchemas',
    );
    await gh.singletonAsync<_i8.SharedPreferences>(
      () => externalModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i6.WatchInternetConnectionUseCase>(
        useCasesModule.watchInternetConnection);
    gh.singleton<_i9.AppSharedPreferences>(
        coreModule.prefs(gh<_i8.SharedPreferences>()));
    await gh.singletonAsync<_i7.Isar>(
      () => externalModule.startIsar(
          gh<List<_i7.CollectionSchema<dynamic>>>(instanceName: 'IsarSchemas')),
      preResolve: true,
    );
    gh.lazySingleton<_i10.PreferencesRepository>(
        () => dataModule.settingsRepository);
    return this;
  }
}

class _$UseCasesModule extends _i11.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.HasInternetConnectionUseCase get hasInternetConnection =>
      _i6.HasInternetConnectionUseCase(_getIt<_i4.ConnectivityProvider>());
  @override
  _i6.WatchInternetConnectionUseCase get watchInternetConnection =>
      _i6.WatchInternetConnectionUseCase(_getIt<_i4.ConnectivityProvider>());
  @override
  _i3.AppSetupUseCase get appSetupUseCase => _i3.AppSetupUseCase();
}

class _$ExternalModule extends _i5.ExternalModule {}

class _$CoreModule extends _i12.CoreModule {}

class _$DataModule extends _i13.DataModule {
  _$DataModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i14.PreferencesRepositoryImpl get settingsRepository =>
      _i14.PreferencesRepositoryImpl(_getIt<_i15.AppSharedPreferences>());
}
