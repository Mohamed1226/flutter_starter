import 'dart:async';

class AppErrorReporter {
  const AppErrorReporter._();

  static Future<void> init({
    required FutureOr<void> Function() appRunner,
  }) async {
    appRunner();
  }

  static recordError(exception,
      {String? reason, StackTrace? stackTrace, bool fatal = false}){}
}
