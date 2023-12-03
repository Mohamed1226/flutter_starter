import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/routing/routes.dart';
import 'package:ready_structure/core/services/navigation.dart';

import 'core/constant/dimens.dart';
import 'core/routing/app_router.dart';
import 'onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(Dimens.designWidth, Dimens.designHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: Routes.onBoarding,
            onGenerateRoute: AppRouter.generateRoute,
            navigatorKey: locator<NavigationService>().navigatorKey,
            home: const OnBoardingScreen(),
          );
        });
  }
}
