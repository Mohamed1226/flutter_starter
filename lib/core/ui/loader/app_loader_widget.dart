import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theming/colors/colors_manager.dart';

class AppLoaderWidget extends StatelessWidget {
  final LoaderSize loaderSize;
  final LoaderType loaderType;
  final Color color;

  const AppLoaderWidget({
    Key? key,
    this.loaderSize = LoaderSize.Normal,
    this.loaderType = LoaderType.circular,
    this.color = AppFixedColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (loaderType) {
      case LoaderType.circular:
        SpinKitDoubleBounce loader;
        if (loaderSize == LoaderSize.Small) {
          loader = SpinKitDoubleBounce(
            duration: const Duration(milliseconds: 1),
            color: color,
            size: 0.06.sw,
          );
        } else {
          loader = SpinKitDoubleBounce(
            duration: const Duration(milliseconds: 1),
            color: color,
          );
        }
        return loader;
      case LoaderType.linear:
        SpinKitThreeBounce loader;
        if (loaderSize == LoaderSize.Small) {
          loader = SpinKitThreeBounce(
              duration: const Duration(milliseconds: 1),
              color: color,
              size: 0.06.sw);
        } else {
          loader = SpinKitThreeBounce(
              duration: const Duration(milliseconds: 1),
              color: color,
              size: 0.07.sw);
        }
        return loader;
    }
  }
}

enum LoaderSize {
  Small,
  Normal,
}

enum LoaderType {
  circular,
  linear,
}
