import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl_pkg;
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';

import 'package:ready_structure/generated/intl/messages_ar.dart' as messages_ar;
import 'package:ready_structure/generated/intl/messages_en.dart' as messages_en;

import '../../generated/l10n.dart';
import '../di/locator.dart';
import '../models/localized_string_value.dart';
import '../shared_prefs/app_shared_prefs.dart';

class AppLocalize {
  AppLocalize._();

  static const langAr = 'ar';
  static const langEn = 'en';

  static S get gen => S.of(ApplicationCubit.context!);

  static String? get deviceLang {
    final localLang = Platform.localeName.split('_').first;
    final supported =
        supportedAppLocals.map((e) => e.langCode).contains(localLang);
    if (supported) return localLang;
  }

  static const defaultLang = langEn;

  /// App locale [_appAppLocal] is the selected language (if user already selected it)
  /// if not .. [_appAppLocal] will be the device
  static AppLocale _appAppLocal =
      (locator<AppSharedPrefs>().appLanguage ?? defaultLang).toAppLocal;

  static Locale get appLocale {
    return _appAppLocal.toLocale;
  }

  static bool get isArabic => appLocale.languageCode == "ar";

  static bool get isRtlLocale =>
      _appAppLocal.textDirection == TextDirection.rtl;

  static List<AppLocale> supportedAppLocals = [
    langAr.toAppLocal,
    langEn.toAppLocal,
    // langUrd.toAppLocal,
    // langFil.toAppLocal,
  ];

  static AppLocale toAppLocale(String langCode) => langCode.toAppLocal;

  static void changeAppLocal(String langCode) {
    _appAppLocal = langCode.toAppLocal;
    locator<AppSharedPrefs>().selectLang(_appAppLocal.langCode);
  }

  static T? localize<T>({T? whenArabic, T? whenEnglish}) {
    switch (AppLocalize.appLocale.languageCode) {
      case langAr:
        return whenArabic;
      case langEn:
        return whenEnglish;
    }
    return whenEnglish;
  }

  /// This method with get a localizedStringValue object based on
  /// the word's key in the Arb files
  static LocalizedStringValue getLSValueFromArbKey(String key) {
    return LocalizedStringValue(
      arValue: messages_ar.messages.messages[key](),
      enValue: messages_en.messages.messages[key](),
    );
  }

  static bool isRTLText(String text) {
    return intl_pkg.Bidi.detectRtlDirectionality(text);
  }

// static tr(String msg) {
//   // S.of(context)
// }
}

class AppLocale extends Equatable {
  final String langCode;
  final String langName;
  final String flagIcon;
  final TextDirection textDirection;
  final LocalizedStringValue? langLocalizedName;

  const AppLocale(
      {required this.langCode,
      required this.langName,
      required this.flagIcon,
      required this.textDirection,
      this.langLocalizedName});

  @override
  List<Object?> get props => [langCode];
}

extension _ToAppLocalExt on String {
  AppLocale get toAppLocal {
    switch (this) {
      case AppLocalize.langAr:
        return const AppLocale(
            langCode: AppLocalize.langAr,
            langName: 'العربية',
            textDirection: TextDirection.rtl,
            flagIcon: "");
      case AppLocalize.langEn:
      default:
        return const AppLocale(
            langCode: AppLocalize.langEn,
            langName: 'English',
            textDirection: TextDirection.ltr,
            flagIcon: "");
    }
  }
}

extension ToLocale on AppLocale {
  Locale get toLocale => Locale(langCode);
}
