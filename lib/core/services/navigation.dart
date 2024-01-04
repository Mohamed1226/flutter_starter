import 'package:flutter/material.dart';
import 'package:ready_structure/core/di/locator.dart';

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

  void navigateByWidget(Widget to) {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => to));
  }

  static pushReplaceLeftToRight(Widget w, [BuildContext? context]) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c)=>w ));

    Navigator.of(context ??
        locator<NavigationService>().navigatorKey.currentState!.context)
        .push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => w,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.linear;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  static pushReplaceRightToLeft(Widget w, BuildContext context) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c)=>w ));

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => w,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset.zero;
        var end = const Offset(1.0, 0.0);
        var curve = Curves.linear;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  static pushRightToLeft(Widget w, BuildContext context) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c)=>w ));

    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => w,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset.zero;
        var end = const Offset(1.0, 0.0);
        var curve = Curves.linear;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  static pushLeftToRight(Widget w, BuildContext context) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c)=>w ));

    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => w,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.linear;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
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
