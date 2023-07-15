import 'package:ve_news/core/data/data.dart';

class HasInternetConnectionUseCase {
  final ConnectivityProvider connectivityProvider;

  HasInternetConnectionUseCase(this.connectivityProvider);

  bool call() => connectivityProvider.lastState ?? false;
}
