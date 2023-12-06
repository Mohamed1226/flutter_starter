import 'package:get_storage/get_storage.dart';
import '../helpers/enum/app_mode.dart';
import 'secure_shared_prefs.dart';
import 'secured_string_value.dart';

class AppSharedPrefs {
  SecureStringValue token = SecureStringValue(_SPKeys.tokenKey);
  SecureStringValue refreshToken = SecureStringValue(_SPKeys.refreshTokenKey);

  final ReadWriteValue<String> _appMode =
      ReadWriteValue(_SPKeys.appMode, AppMode.Light.name);
  final ReadWriteValue<String?> _appLanguage =
      ReadWriteValue(_SPKeys.appLanguage, null);

  Future<void> init() async {
    await GetStorage.init();
    await _initAllSecure();
  }

  Future<void> _initAllSecure() async {
    await token.fetch();
    await refreshToken.fetch();
  }

  Future<void> clearSecureSP() async {
    return SecureSharedPrefs.clear();
  }
}

extension FirstRunSPValue on AppSharedPrefs {
  String get appMode => _appMode.val;

  String? get appLanguage => _appLanguage.val;

  void setAppMode(String appMode) {
    _appMode.val = appMode;
  }

  void selectLang(String locale) {
    _appLanguage.val = locale;
  }
}

abstract class _SPKeys {
  static const tokenKey = 'tokenKey';
  static const refreshTokenKey = 'refreshTokenKey';
  static const appMode = 'appMode';
  static const appLanguage = 'appLanguage';
}
