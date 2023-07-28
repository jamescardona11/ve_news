import 'dart:developer' as developer;

const logger = ElevenLogger();

class ElevenLogger {
  const ElevenLogger();

  void i(String? text, {String? tag, bool showTime = false}) {
    _log(text, _LogStatusInfo());
  }

  void s(String? text, {String? tag, bool showTime = false}) {
    _log(text, _LogStatusSuccess());
  }

  void e(String? text, {String? tag, bool showTime = false, StackTrace? stackTrace, Object? error}) {
    _log(text, _LogStatusError());
  }

  void d(String? text, {String? tag, bool showTime = false}) {
    _log(text, _LogStatusDebug());
  }

  void _log(String? text, _LogStatus status, {String? tag, bool showTime = false, StackTrace? stackTrace, Object? error}) {
    String time = showTime ? DateTime.now().toString() : '';
    if (time.isNotEmpty) {
      time = '[$time]';
    }

    final msg = '$time[${status.emoji}] $text';
    developer.log('${status.color}$msg\x1B[0m', name: tag ?? status.tag, stackTrace: stackTrace, error: error);
  }
}

// https://en.wikipedia.org/wiki/ANSI_escape_code
sealed class _LogStatus {
  final String tag;
  final String emoji;
  final String color;

  _LogStatus(this.tag, this.emoji, this.color);
}

class _LogStatusInfo extends _LogStatus {
  _LogStatusInfo() : super('INFO', '👻', '\x1B[33m');
}

class _LogStatusSuccess extends _LogStatus {
  _LogStatusSuccess() : super('SUCCESS', '✅', '\x1B[32m');
}

class _LogStatusError extends _LogStatus {
  _LogStatusError() : super('ERROR', '😡', '\x1B[91m');
}

class _LogStatusDebug extends _LogStatus {
  _LogStatusDebug() : super('DEBUG', '👾', '\x1B[34m');
}
