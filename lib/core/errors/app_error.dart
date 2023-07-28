sealed class AppError {
  final String message;
  final dynamic err;

  AppError(this.message, [this.err]);

  @override
  String toString() {
    return Error.safeToString('$message $err');
  }

  bool get isUnexpectedError => this is UnexpectedError;
  bool get isHttpResponseError => this is HttpResponseError;
  bool get isNoInternetError => this is NoInternetError;
  bool get isNoPermissionError => this is NoPermissionError;
  bool get isSpeechError => this is SpeechError;
  bool get isNoCreditsError => this is NoCreditsError;
}

final class NoInternetError extends AppError {
  NoInternetError() : super('No internet connection');
}

final class HttpResponseError extends AppError {
  HttpResponseError({String? source, dynamic err}) : super('Api response error', err);
}

final class UnexpectedError extends AppError {
  UnexpectedError() : super('Encountered a Unexpected at an unrecoverable point. Terminating.');
}

final class NoPermissionError extends AppError {
  NoPermissionError({String? type}) : super('No ${type ?? ''} permission error.');
}

final class SpeechError extends AppError {
  SpeechError({String? message}) : super(message ?? 'Speech error.');
}

final class NoCreditsError extends AppError {
  NoCreditsError({String? message}) : super(message ?? 'No credits error.');
}
