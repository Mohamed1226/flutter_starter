import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

class PngImageAsset extends StatelessWidget {
  final String? assetName;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const PngImageAsset(this.assetName,
      {Key? key, this.color, this.fit, this.width, this.height, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName ?? '',
      color: color,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
    );
  }
}

class PngImageAssetWithDefaultColor extends StatelessWidget {
  final String? assetName;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const PngImageAssetWithDefaultColor(this.assetName,
      {Key? key, this.color, this.fit, this.width, this.height, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName ?? '',
      color: color ?? ColorsManager.instance(context).primaryColor,
      fit: fit ?? BoxFit.none,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
    );
  }
}
