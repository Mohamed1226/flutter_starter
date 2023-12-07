import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ready_structure/app.dart';
import 'package:ready_structure/core/networking/errors/app_error_reporter/app_error_reporter.dart';

import 'core/di/locator.dart';

void main() {
  runZonedGuarded(
    () async {
      setupLocator();
      await AppErrorReporter.init(appRunner: () => runApp(const MyApp()));
    },
    (Object error, StackTrace stack) {
      AppErrorReporter.recordError(error, stackTrace: stack);
      AppErrorReporter.onStackError(stack);
    },
  );
}
