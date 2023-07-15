import 'package:injectable/injectable.dart';
import 'package:ve_news/core/use_cases/use_cases.dart';

@module
abstract class UseCasesModule {
  /// Cross Use Cases
  @singleton
  HasInternetConnectionUseCase get hasInternetConnection;

  @singleton
  WatchInternetConnectionUseCase get watchInternetConnection;
}
