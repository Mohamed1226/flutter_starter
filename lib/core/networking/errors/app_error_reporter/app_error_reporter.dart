import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../ui/snackbar_and_toast/app_toast.dart';


class AppErrorReporter {
  AppErrorReporter() {
    _setup();
  }

  static Future<void> init({
    required FutureOr<void> Function() appRunner,
  }) async {
    appRunner();
    _setup();
    // await AppErrorHandler._disableDebugReporting();
  }

  static _setup() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      onError(details);
    };
  }

  static onError(FlutterErrorDetails details) {
    var msg = '${details.library} : ${details.exception}';
    AppToast.showDebugToast(msg);
  }

  static onStringError(String error) {
    log(error);
    AppToast.showDebugToast(error);
  }

  static onExcError(Exception exception) {
    log(exception.toString());
    AppToast.showDebugToast(exception.toString());
  }

  static onStackError(StackTrace stack) {
    log(stack.toString());
    AppToast.showDebugToast(stack.toString());
  }

  static reportError() {
    //TODO: do stuff here like Google Analytics , Adjust
  }

  static Future<void> recordError(exception,
      {String? reason, StackTrace? stackTrace, bool fatal = false}) async {
    try {
      //  await FirebaseCrashlytics.instance.recordError(exception, stackTrace,
      //     reason: 'ADM>> ' + (reason ?? 'a non-fatal error>>'),
      //       fatal: fatal,
      //       printDetails: true);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> logMessage(String message) async {
    try {
      //  FirebaseCrashlytics.instance.log(message);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> _disableDebugReporting() async {
    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      //  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
    }
  }

// static Future<void> setUserInfo(String userId, {UserModel? user}) async {
//   try {
//     await FirebaseCrashlytics.instance.setUserIdentifier(userId);
//     if (user != null) {
//       await FirebaseCrashlytics.instance.setCustomKey('displayName', user.displayName ?? '');
//     }
//   } catch (_) {}
// }
}
