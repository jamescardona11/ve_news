import 'package:injectable/injectable.dart';
import 'package:ve_news/common/domain/use_cases/use_cases.dart';
import 'package:ve_news/domain/app_setup/use_case/app_setup_use_case.dart';

@module
abstract class UseCasesModule {
  /// Cross Use Cases
  @singleton
  HasInternetConnectionUseCase get hasInternetConnection;

  @singleton
  WatchInternetConnectionUseCase get watchInternetConnection;

  // Setup app

  @singleton
  AppSetupUseCase get appSetupUseCase;

  // Articles
}
