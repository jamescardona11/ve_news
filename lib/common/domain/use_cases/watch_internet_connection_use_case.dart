import 'package:ve_news/common/data/connectivity_provider.dart';

class WatchInternetConnectionUseCase {
  final ConnectivityProvider connectivityProvider;

  WatchInternetConnectionUseCase(this.connectivityProvider);

  Stream<bool>? call() => connectivityProvider.watch;
}
