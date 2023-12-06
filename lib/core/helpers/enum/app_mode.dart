
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';

import '../../di/locator.dart';

enum AppMode {
  Light,
  Night;

  AppMode getAppMode() {
    return AppMode.values
        .firstWhere((element) => locator<AppSharedPrefs>().appMode == element.name);
  }

  static  bool get isDarkMode => locator<AppSharedPrefs>().appMode == AppMode.Night.name;

}
