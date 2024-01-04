import 'package:flutter/material.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/services/navigation.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }

  void navigateByWidget(Widget to) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => to));
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
        var end = Offset(1.0, 0.0);
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
        var end = Offset(1.0, 0.0);
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
        var begin = Offset(1.0, 0.0);
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
