import 'package:get_it/get_it.dart';
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';

import '../services/navigation.dart';
import '../shared_prefs/app_shared_prefs.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs());
  locator.registerLazySingleton<ApplicationCubit>(() => ApplicationCubit());
}
