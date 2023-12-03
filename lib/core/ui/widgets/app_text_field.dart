import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theming/colors/colors_manager.dart';
import '../../theming/styles/fonts.dart';
import '../../validators/base_validators.dart';

class AppTextFormField extends StatelessWidget {
  final bool obsure;
  final bool selectAllOnFocus;
  final TextInputType? type;
  final FormFieldSetter? onSaved;
  final FormFieldSetter? onChange;
  final VoidCallback? onTap;
  final FormFieldValidator? validate;
  final String? label;
  final String? hintText;
  final List<BaseValidator> validators;
  final int? maxLines;
  final bool isEnableBorder;
  final bool enable;
  final bool autofocus;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final double? h;
  final double? w;
  final FocusNode? focusNode;
  final String? inputFormatterText;
  final List<TextInputFormatter>? inputFormatter;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? labelColor;

  const AppTextFormField(
      {Key? key,
      this.obsure = false,
      this.selectAllOnFocus = false,
      this.borderRadius,
      this.hintStyle,
      this.style,
      this.focusNode,
      this.enable = true,
      this.autofocus = false,
      this.type,
      this.onSaved,
      this.validators = const [],
      this.fontSize,
      this.fontWeight = AppFontWeight.weight_400,
      this.onChange,
      this.onTap,
      this.validate,
      this.inputFormatter,
      this.inputFormatterText,
      this.label,
      this.hintText,
      this.maxLines,
      this.isEnableBorder = true,
      this.controller,
      this.prefix,
      this.suffix,
      this.labelColor,
      this.h,
      this.w})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autovalidateMode: AutovalidateMode.disabled,
        controller: controller,
        style: style ?? Styles.font14PrimaryColorWeight500(),
        obscureText: obsure,
        enabled: enable,
        autofocus: autofocus,
        onTap: gestureTapCallback(),
        focusNode: focusNode,
        onSaved: onSaved,
        validator: (value) => BaseValidator.validateValue(
            context, inputFormatterText ?? value, validators, true),
        onChanged: onChange,
        maxLines: maxLines,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          errorBorder: isEnableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 60),
                  borderSide: const BorderSide(
                    color: AppFixedColors.red,
                  ))
              : InputBorder.none,
          hintText: hintText,
          enabledBorder: isEnableBorder ? defaultBorder() : null,
          disabledBorder: defaultBorder(),
          border: isEnableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 60),
                  borderSide: BorderSide(
                    color: ColorsManager.instance(context).primaryColor,
                  ))
              : InputBorder.none,
          //  focusColor: Colors.black,
          focusedBorder: isEnableBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorsManager.instance(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 60),
                )
              : null,
          labelText: label,
          hintStyle: hintStyle ?? Styles.font14PrimaryColorWeight500(),
          labelStyle: Styles.font14PrimaryColorWeight500(),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        keyboardType: type ??
            const TextInputType.numberWithOptions(
              decimal: true,
            ),
      ),
    );
  }

  GestureTapCallback? gestureTapCallback() {
    if (selectAllOnFocus) {
      return () => controller?.selection = TextSelection(
          baseOffset: 0, extentOffset: controller!.value.text.length);
    } else {
      return onTap;
    }
  }

  OutlineInputBorder defaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 60),
      borderSide: BorderSide(color: ColorsManager.defaultInstance.primaryColor),
    );
  }
}
