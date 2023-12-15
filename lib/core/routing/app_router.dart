import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ready_structure/core/routing/routes.dart';
import 'package:ready_structure/splash_screen.dart';

class AppRouter {
  static Widget generatePage(String? name, Object? arguments) {
    Widget page;
    switch (name) {
      case Routes.splash:
        page = const SplashScreen();
        break;

      ///example if there is arguments
      // case Routes.splash:
      //   final arg = arguments as List;
      //   page = onBoarding(
      //     user: arg.first as Future<user>,
      //     mailbox: arg[1] as Mailbox,
      //   );
      //   break;
      default:
        if (kDebugMode) {
          print('Unknown route: $name');
        }
        page = Scaffold(
          body: Center(child: Text('No route defined for $name')),
        );
    }
    return page;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = generatePage(settings.name, settings.arguments);
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => page)
        : CupertinoPageRoute(builder: (_) => page);
  }
}
