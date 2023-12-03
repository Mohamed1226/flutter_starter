import 'package:flutter/material.dart';

import '../../constant/dimens.dart';

class GradientBorderCard extends StatelessWidget {
  const GradientBorderCard(
      {super.key,
      required this.child,
      required this.colors,
      this.height = 100});

  final Widget child;
  final List<Color> colors;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: height,
      width: Dimens.designWidth,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
