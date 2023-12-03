import 'package:flutter/foundation.dart';

enum BuildType { release, debug, profile }

extension BuildTypeExt on BuildType{
  static BuildType  get currentBuild => currentBuildType();

  static BuildType currentBuildType() {
    if (kDebugMode) {
      return BuildType.debug;
    }
    if (kReleaseMode) {
      return BuildType.release;
    }
    if (kProfileMode) {
      return BuildType.profile;
    }
    return BuildType.debug;
  }

  static bool isDebug() {
    return currentBuildType()==BuildType.debug;
  }

  static bool isRelease() {
    return currentBuildType()==BuildType.release;
  }
}



