

import '../app_localization/app_localization.dart';

class LocalizedStringValue {
  String get value {
    return AppLocalize.localize(whenArabic: arValue, whenEnglish: enValue) ?? '';
  }

  final String? arValue;
  final String? enValue;

  const LocalizedStringValue({required this.arValue, required this.enValue});

  /// Expects json model like:
  /// {
  ///   "ar": "مرحبا",
  ///   "en": "hello"
  /// }
  factory LocalizedStringValue.fromJson(Map<String, dynamic> json) {
    return LocalizedStringValue(arValue: json['ar'], enValue: json['en']);
  }

  factory LocalizedStringValue.fromArbKey(String key) {
    return AppLocalize.getLSValueFromArbKey(key);
  }

  Map<String, dynamic> toJson() => {
    "arValue": arValue == null ? null : arValue,
    "enValue": enValue == null ? null : enValue,
  };

  @override
  String toString() {
    return 'LocalizedStringValue{arValue: $arValue, enValue: $enValue}';
  }
}
