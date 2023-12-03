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
