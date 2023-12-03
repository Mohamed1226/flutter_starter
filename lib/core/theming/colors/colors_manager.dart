import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

abstract class ColorsManager {
  static final DarkColors _dark = DarkColors();
  static final LightColors _light = LightColors();

  static bool get isDarkMode => false;

  static ColorsManager get defaultInstance => isDarkMode ? _dark : _light;

  static ColorsManager instance(BuildContext context) =>
      isDarkMode ? _dark : _light;

  late Color primaryColor;
}

class AppFixedColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
}
