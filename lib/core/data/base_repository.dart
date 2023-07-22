import 'dart:async';

import 'package:flutter/material.dart';

base mixin BaseRepository {
  final List<StreamSubscription> _subscriptions = [];

  void safeSubscribe(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  @mustCallSuper
  Future<void> close() {
    return Future.wait(_subscriptions.map((e) => e.cancel()));
  }
}
