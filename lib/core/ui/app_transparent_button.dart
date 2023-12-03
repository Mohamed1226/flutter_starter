import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../constant/dimens.dart';

class TransparentButton extends StatefulWidget {
  final Widget? textChild;
  final String? text;
  final Function? onPressed;

  final Color? color;

  final double? width;

  final double? borderRadius;

  const TransparentButton(
      {Key? key,
      this.textChild,
      this.onPressed,
      this.color,
      this.width,
      this.borderRadius,
      this.text})
      : super(key: key);

  @override
  _TransparentButtonState createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      constraints: BoxConstraints(minHeight: 48.h),
      // ignore: deprecated_member_use
      child: OutlinedButton(
        onPressed: () {
          widget.onPressed!();
        },
        style: ElevatedButton.styleFrom(
          // backgroundColor: AppColors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimens.buttonBorderRadius),
              side: BorderSide(
                  color: widget.color ??
                      ColorsManager.instance(context).primaryColor)),
        ),
        child: Center(
          child: widget.textChild ??
              Text(
                widget.text!,
                style: Styles.font14PrimaryColorWeight500(),
              ),
        ),
      ),
    );
  }
}
