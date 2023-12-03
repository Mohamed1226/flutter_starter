import 'package:flutter/material.dart';
import 'package:ready_structure/core/routing/routes.dart';

import '../../app_localization/app_localization.dart';
import '../../di/locator.dart';
import '../../ui/cubit/app_cubit.dart';
import '../../ui/state/cubit_state.dart';
import '../navigation.dart';

class ApplicationCubit extends AppCubit {
  ApplicationCubit() : super(InitResource());

  static BuildContext? get context =>
      locator<NavigationService>().navigatorKey.currentState?.context;

  void changeLanguage(String langCode, {bool needToRefreshApp = true}) async {
    AppLocalize.changeAppLocal(langCode);
    if (needToRefreshApp) {
      refreshApp();
    }
  }

  // void changeAppColorMode({required bool isDarkMode}) async {
  //   if (isDarkMode) {
  //     DIManager.sharedPrefs.setDarkMode(AppMode.Night.name);
  //   } else {
  //     DIManager.sharedPrefs.setDarkMode(AppMode.Light.name);
  //   }
  //
  //   refreshApp(withReRunApp: false);
  // }

  void refreshApp({bool withReRunApp = true}) {
    if (withReRunApp) {
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.onBoarding);
    } else {
      rebuildAllChildren(
          locator<NavigationService>().navigatorKey.currentState!.context);
    }

    emit(RefreshResource());
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
