import 'package:ve_news/cross/data/connectivity_provider.dart';

class WatchInternetConnectionUseCase {
  final ConnectivityProvider connectivityProvider;

  WatchInternetConnectionUseCase(this.connectivityProvider);

  Stream<bool>? call() => connectivityProvider.watch;
}
