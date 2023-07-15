import 'package:ve_news/core/data/data.dart';

class WatchInternetConnectionUseCase {
  final ConnectivityProvider connectivityProvider;

  WatchInternetConnectionUseCase(this.connectivityProvider);

  Stream<bool>? call() => connectivityProvider.watch;
}
