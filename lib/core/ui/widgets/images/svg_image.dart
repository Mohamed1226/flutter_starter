import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

class SvgImageAsset extends StatelessWidget {
  final String? assetName;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const SvgImageAsset(this.assetName,
      {Key? key, this.color, this.fit, this.width, this.height, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName ?? '',
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
    );
  }
}

class SvgImageAssetWithDefaultIcon extends StatelessWidget {
  final String? assetName;
  final Color? color;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const SvgImageAssetWithDefaultIcon(this.assetName,
      {Key? key, this.color, this.fit, this.width, this.height, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName ?? '',
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
    );
  }
}
