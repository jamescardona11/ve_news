import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityProvider {
  final PublishSubject<bool> _connectivitySubject = PublishSubject<bool>();

  ConnectivityProvider() {
    _initStream();
  }

  bool? _isConnected;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  Future<void> close() async {
    await _connectivitySubscription?.cancel();
    await _connectivitySubject.close();
  }

  Stream<bool> get watch => _connectivitySubject.stream;
  bool? get lastState => _isConnected;

  void _initStream() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _emitWhenChange(result);
    });
  }

  Future<void> _emitWhenChange(ConnectivityResult result) async {
    final isConnected = result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.ethernet;

    // no emit a new state when is the same as the previous
    if (_isConnected == isConnected) return;
    _isConnected = isConnected;

    _connectivitySubject.add(isConnected);
  }
}
