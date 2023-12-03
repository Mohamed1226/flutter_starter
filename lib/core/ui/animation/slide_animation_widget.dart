import 'package:flutter/cupertino.dart';

class SlideAnimationWidget {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  var beginOffset = Offset(10, 0);
  var endOffset = Offset(-3, 0.0);

  void setup(
      {required TickerProvider tickerProvider,
      Duration duration = const Duration(seconds: 1)}) {
    _animationController = AnimationController(
      vsync: tickerProvider,
      duration: duration,
    );
    _setupAnimation();
  }

  void _setupAnimation() {
    _animation = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  Widget build({required Widget widget}) {
    return SlideTransition(
      position: _animation,
      child: widget,
    );
  }

  void start(bool show, Function completion) {
    if (show) {
      beginOffset = Offset(10, 0);
      endOffset = Offset(0.0, 0.0);
    } else {
      beginOffset = Offset(0.0, 0.0);
      endOffset = Offset(1.2, 0.0);
    }

    if (show) {
      completion();
    } else {
      Future<void>.delayed(Duration(milliseconds: 400), () {
        completion();
      });
    }

    _setupAnimation();
    _animationController.forward(from: 0);
  }

  void startGuide({required Function completion}) {
    Future<void>.delayed(Duration(seconds: 1), () {
      start(true, completion);
    });
    Future<void>.delayed(Duration(seconds: 3), () {
      start(false, completion);
    });
  }

  void fakeTest() {
    Future<void>.delayed(Duration(seconds: 1), () {
      _animationController.forward();
    });
  }
}
