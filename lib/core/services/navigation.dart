import 'package:flutter/material.dart';

import '../routing/app_router.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get currentContext => navigatorKey.currentContext;

  String? get currentRouteName => _currentRouteName;
  String? _currentRouteName;

  Future<dynamic> push(
    String routeName, {
    Object? arguments,
    bool replace = false,
    bool fade = false,
    bool clear = false,
  }) {
    _currentRouteName = routeName;
    final page = AppRouter.generatePage(routeName, arguments);
    Route route;
    if (fade) {
      route = FadeRoute(page: page);
    } else {
      route = MaterialPageRoute(builder: (_) => page);
      // route = PlatformInfo.isCupertino
      //     ? CupertinoPageRoute(builder: (_) => page)
      //     : MaterialPageRoute(builder: (_) => page);
    }
    if (clear) {
      return navigatorKey.currentState!
          .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
      //    navigatorKey.currentState!.pop();
    }
    if (replace) {
      // history.replace(routeName, route);
      return navigatorKey.currentState!.pushReplacement(route);
    } else {
      // history.push(routeName, route);
      return navigatorKey.currentState!.push(route);
    }
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (Route<dynamic> route) => false);
  }

  void popUntil(String routeName) {
    // history.popUntil(routeName);
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
    _currentRouteName = routeName;
  }

  void pop([Object? result]) {
    // history.pop();
    navigatorKey.currentState!.pop(result);
    _currentRouteName = null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
