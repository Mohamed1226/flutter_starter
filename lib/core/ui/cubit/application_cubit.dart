import 'package:flutter/material.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/helpers/enum/app_mode.dart';
import 'package:ready_structure/core/routing/routes.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';

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

  void changeAppColorMode({required AppMode appMode}) async {
    locator<AppSharedPrefs>().setAppMode(appMode.name);
    refreshApp(withReRunApp: false);
  }

  void refreshApp({bool withReRunApp = true}) {
    if (withReRunApp) {
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.changeLang);
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
