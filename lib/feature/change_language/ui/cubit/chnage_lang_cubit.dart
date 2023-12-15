import 'package:flutter/material.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/helpers/enum/app_mode.dart';
import 'package:ready_structure/core/routing/routes.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/ui/cubit/app_cubit.dart';
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';

class ChangeLangCubit extends AppCubit {
  ChangeLangCubit() : super(InitResource());

  void changeLanguage()  {
    if (locator<AppSharedPrefs>().appLanguage != null &&
        locator<AppSharedPrefs>().appLanguage! == AppLocalize.langAr) {
      AppLocalize.changeAppLocal(AppLocalize.langEn);
    } else {
      AppLocalize.changeAppLocal(AppLocalize.langAr);
    }
      emit(SuccessResource());
    locator<ApplicationCubit>().refreshApp(withReRunApp: false);
  }
}
