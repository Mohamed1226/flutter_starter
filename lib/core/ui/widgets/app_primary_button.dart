import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import 'rounded_animated_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final double radius;
  final double? width, height, fontSize;
  final Widget? icon;
  final Widget? trailing;
  final Widget? bottomWidget;
  final bool isClickable;
  final EdgeInsetsGeometry? padding;

  //TODO:imp
  final EdgeInsetsGeometry? margin;

  const AppPrimaryButton({
    Key? key,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.height = 48,
    this.icon,
    this.trailing,
    this.bottomWidget,
    this.isClickable = true,
    required this.text,
    this.onPressed,
    this.radius = 50,
    this.color,
    this.textColor,
    this.borderColor,
    this.padding,
    this.margin,
    this.underLinedText = false,
  }) : super(key: key);
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool underLinedText;

  @override
  Widget build(BuildContext context) {
    return RoundedAnimatedButton(
      isBordered: true,
      width: width,
      padding: padding,
      height: height,
      borderColor: borderColor,
      borderRadius: radius,
      onPressed: isClickable ? onPressed : null,
      color: isClickable
          ? color ?? ColorsManager.instance(context).buttonColor
          : ColorsManager.instance(context).buttonColor.withOpacity(.6),
      child: FittedBox(
        child: Row(
          children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: icon!,
                    ),
                  FittedBox(
                    child: Text(
                      text,
                      style: Styles.font14PrimaryColorWeight500(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
                if (bottomWidget != null) bottomWidget!
              ],
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
