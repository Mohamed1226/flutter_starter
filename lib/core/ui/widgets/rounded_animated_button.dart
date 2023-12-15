import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../constant/dimens.dart';
import '../../theming/colors/colors_manager.dart';
import '../loader/app_loader_widget.dart';

class RoundedAnimatedButton extends StatefulWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final Widget? child;

  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final double? borderRadius;

  final bool isActive;
  final bool isBordered;
  final Color? borderColor;
  final bool isSelected;

  final EdgeInsetsGeometry? padding;

  final Color? splashColor;
  final Color? highlightColor;

  final bool isLoading;

  const RoundedAnimatedButton(
      {Key? key,
      this.text,
      this.isSelected = false,
      this.child,
      this.isLoading = false,
      this.color,
      this.textColor,
      required this.onPressed,
      this.width,
      this.height,
      this.borderRadius,
      this.isActive = true,
      this.isBordered = false,
      this.borderColor,
      this.padding,
      this.splashColor,
      this.highlightColor})
      : super(key: key);

  @override
  _RoundedAnimatedButtonState createState() => _RoundedAnimatedButtonState();
}

class _RoundedAnimatedButtonState extends State<RoundedAnimatedButton> {
  final Duration _animationDuration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: widget.isActive ? 1.0 : 0.4,
      child: AnimatedContainer(
        duration: _animationDuration,
        width: widget.width,
        constraints: BoxConstraints(minHeight: widget.height ?? 48.h),
        child: MaterialButton(
          minWidth: widget.width,
          highlightColor: widget.highlightColor,
          splashColor: widget.splashColor,
          elevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          hoverElevation: 0.0,
          onPressed: () {
            if (widget.isActive && widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          padding: widget.padding,
          shape: RoundedRectangleBorder(
              side: widget.isBordered
                  ? BorderSide(
                      color: widget.borderColor ??
                          AppFixedColors.white.withAlpha(0),
                      width: widget.isSelected ? 2.5.w : 1.w)
                  : const BorderSide(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(
                  (widget.borderRadius ?? Dimens.buttonBorderRadius))),
          color: (widget.color ?? ColorsManager.instance(context).buttonColor),
          child: Center(
            child: widget.isLoading
                ? const AppLoaderWidget(
                    color: AppFixedColors.black, loaderSize: LoaderSize.Small)
                : (widget.child ??
                    Text(
                      widget.text ?? '',
                      textAlign: TextAlign.center,
                      style: Styles.font14PrimaryColorWeight500(
                          color: widget.textColor ?? Colors.white),
                    )),
          ),
        ),
      ),
    );
  }
}
