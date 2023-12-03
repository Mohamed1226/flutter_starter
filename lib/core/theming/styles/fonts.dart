import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

class Styles {
  Styles._();

  /// Font family
  static String get _fontFamily => GoogleFonts.tajawal().fontFamily!;

  static TextStyle font14PrimaryColorWeight500(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      double? height,
      TextDecoration? decoration}) {
    return TextStyle(
        fontSize: fontSize ?? AppFontSize.fontSize_14,
        fontWeight: fontWeight ?? AppFontWeight.weight_500,
        height: height,
        decoration: decoration,
        fontFamily: _fontFamily,
        color: color ?? ColorsManager.defaultInstance.primaryColor);
  }

  static TextStyle font12PrimaryColorWeight700(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? AppFontSize.fontSize_12,
        fontWeight: fontWeight ?? AppFontWeight.weight_700,
        fontFamily: _fontFamily,
        color: color ?? ColorsManager.defaultInstance.primaryColor);
  }


  static const appScrollPhysics = const BouncingScrollPhysics();

  // static BoxDecoration formFieldDecoration = BoxDecoration(
  //     borderRadius: BorderRadius.circular(Dimens.textFormBorder),
  //     boxShadow: [
  //       BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 7,
  //           color: AppFixedColors.grey3.withOpacity(0.9),
  //           offset: Offset(0.0, 2.5))
  //     ]);

  static const Shadow defaultTextShadow =
  Shadow(color: Colors.black54, offset: Offset(0.5, 1));
  static const double appbarElevation = 4.0;

  static const shadow1 = BoxShadow(
      color: const Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(4, 4),
      blurRadius: 36);

  static const shadow2 = BoxShadow(
      color: const Color.fromRGBO(0, 0, 0, 0.0599),
      offset: Offset(2, 4),
      blurRadius: 36);

  static const shadow3 = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      spreadRadius: 5,
      offset: Offset(4, 4),
      blurRadius: 28);

  static const shadow4 = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(2, 4),
      blurRadius: 36);

  static const shadow5 = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.079),
      offset: Offset(4, 4),
      blurRadius: 32);

  static const shadow6 = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(4, -6),
      blurRadius: 40);

  static const shadow7 = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(-4, -6),
      blurRadius: 40);

  static const appbarShadow = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 4),
      blurRadius: 32);

  static const playButtonShadow = BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.11999999731779099),
      offset: Offset(4, 4),
      blurRadius: 32);

  static const BoxShadow navBarShadow =  BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.11999999731779099),
      offset: Offset(4, 4),
      blurRadius: 28);

  static ImageFilter get blur =>
      ImageFilter.blur(
        sigmaX: .5,
        sigmaY: .5,
      );

  static ImageFilter get blur1 =>
      ImageFilter.blur(
        sigmaX: .5,
        sigmaY: .5,
      );
  static ImageFilter get blur2 =>
      ImageFilter.blur(
        sigmaX: 1.5,
        sigmaY: 1.5,
      );

  static ImageFilter get blur3 =>
      ImageFilter.blur(
        sigmaX: 3.0,
        sigmaY: 3.0,
      );
}

class AppFontSize {
  const AppFontSize._();

  static const double scaleFactor = 1.15;

  /// Font sizes
  static const double fontSize_7 = 7 * scaleFactor;

  static const double fontSize_8 = 8 * scaleFactor;

  static const double fontSize_9 = 9 * scaleFactor;

  static const double fontSize_10 = 10 * scaleFactor;

  static const double fontSize_11 = 11 * scaleFactor;

  static const double fontSize_12 = 12 * scaleFactor;

  static const double fontSize_13 = 13 * scaleFactor;

  static const double fontSize_14 = 14 * scaleFactor;

  static const double fontSize_15 = 15 * scaleFactor;

  static const double fontSize_16 = 16 * scaleFactor;

  static const double fontSize_18 = 18 * scaleFactor;

  static const double fontSize_20 = 20 * scaleFactor;

  static const double fontSize_24 = 24 * scaleFactor;

  static const double fontSize_25 = 25 * scaleFactor;

  static const double fontSize_26 = 26 * scaleFactor;

  static const double fontSize_32 = 32 * scaleFactor;

  static const double fontSize_35 = 35 * scaleFactor;

  static const double fontSize_40 = 40 * scaleFactor;
}

class AppFontWeight {
  const AppFontWeight._();

  static const FontWeight semiBold = weight_600;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight extraBold = FontWeight.w900;
  static const FontWeight medium = FontWeight.normal;

  static const FontWeight weight_100 = FontWeight.w100;
  static const FontWeight weight_200 = FontWeight.w200;
  static const FontWeight weight_300 = FontWeight.w300;
  static const FontWeight weight_400 = FontWeight.w400;
  static const FontWeight weight_500 = FontWeight.w500;
  static const FontWeight weight_600 = FontWeight.w600;
  static const FontWeight weight_700 = FontWeight.w700;
}
