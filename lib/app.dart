import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/routing/routes.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/splash_screen.dart';

import 'core/app_localization/app_localization.dart';
import 'core/constant/dimens.dart';
import 'core/routing/app_router.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(Dimens.designWidth, Dimens.designHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            locale: AppLocalize.appLocale,
            supportedLocales:
            AppLocalize.supportedAppLocals.map((e) => e.toLocale).toList(),
            localizationsDelegates: const [
              S.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: Routes.splash,
            onGenerateRoute: AppRouter.generateRoute,
            navigatorKey: locator<NavigationService>().navigatorKey,
            home: const SplashScreen(),
          );
        });
  }
}
