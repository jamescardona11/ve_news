import 'package:ve_news/cross/data/connectivity_provider.dart';

class HasInternetConnectionUseCase {
  final ConnectivityProvider connectivityProvider;

  HasInternetConnectionUseCase(this.connectivityProvider);

  bool call() => connectivityProvider.lastState ?? false;
}
