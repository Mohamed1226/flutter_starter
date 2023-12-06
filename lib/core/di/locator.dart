import 'package:get_it/get_it.dart';

import '../services/navigation.dart';
import '../shared_prefs/app_shared_prefs.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AppSharedPrefs());
}
