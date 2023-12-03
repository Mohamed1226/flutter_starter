import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

import 'cached_image.dart';
import 'png_image.dart';
import 'svg_image.dart';


class CustomImage extends StatelessWidget {
  final double cornerRadius;
  final Color? color;
  final double? width;
  final double? height;
  final String? image;
  final Widget? placeHolder;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final bool hasBorder;
  final Border? border;
  final BoxShadow? shadow;
  final BoxFit? boxFit;
  final EdgeInsets? padding;
  final bool isShowPlusIcon;

  const CustomImage._({
    required this.cornerRadius,
    required this.image,
    this.backgroundColor,
    this.color,
    this.width,
    this.boxFit,
    this.height,
    this.placeHolder,
    this.isNetworkImage = true,
    this.isShowPlusIcon = false,
    this.shadow,
    this.hasBorder = false,
    this.border,
    this.padding,
  });

  factory CustomImage.circular({
    required double radius,
    required String? image,
    Widget? placeHolder,
    BoxShadow? shadow,
    BoxFit? boxFit,
    Color? backgroundColor,
    Color? color,
    EdgeInsets? padding,
    bool hasBorder = false,
    isNetworkImage = true,
    Border? border,
  }) =>
      CustomImage._(
        image: image,
        cornerRadius: radius,
        height: radius,
        width: radius,
        boxFit: boxFit,
        color: color,
        backgroundColor: backgroundColor,
        isNetworkImage: isNetworkImage,
        placeHolder: placeHolder,
        shadow: shadow,
        hasBorder: hasBorder,
        border: border,
        padding: padding,
      );

  factory CustomImage.rectangle({
    double cornerRadius = 0.0,
    required String? image,
    double? width,
    double? height,
    Widget? placeHolder,
    BoxShadow? shadow,
    BoxFit? boxFit,
    Color? backgroundColor,
    bool isShowPlusIcon = false,
    Color? color,
    bool hasBorder = false,
    isNetworkImage = true,
    EdgeInsets? padding,
    Alignment? alignment,
  }) =>
      CustomImage._(
        image: image,
        cornerRadius: cornerRadius,
        height: height,
        width: width,
        boxFit: boxFit,
        color: color,
        isShowPlusIcon: isShowPlusIcon,
        backgroundColor: backgroundColor,
        isNetworkImage: isNetworkImage,
        placeHolder: placeHolder,
        shadow: shadow,
        padding: padding,
        hasBorder: hasBorder,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          boxShadow: shadow == null ? [] : [shadow!],
          border: !(hasBorder == true)
              ? Border.all(color: Colors.transparent, width: 0.0)
              : border ??
                  Border.all(
                      color: ColorsManager.defaultInstance.primaryColor
                          .withOpacity(0.7),
                      width: 0.7),
          borderRadius: BorderRadius.circular(cornerRadius),
          color: backgroundColor),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cornerRadius),
          child: isNetworkImage
              ? CachedImage(
                  imageUrl: image ?? '',
                  placeholder: placeHolder,
                  fit: boxFit ?? BoxFit.cover,
                )
              : _buildLocalImage(),
        ),
      ),
    );
  }

  Widget _buildLocalImage() {
    bool isSvgPicture = image?.endsWith('svg') == true;
    if (isSvgPicture) {
      return Stack(
        children: [
          Row(
            children: [
              SvgImageAsset(
                image,
                fit: boxFit ?? BoxFit.cover,
                color: color,
                height: height,
                width: width,
              ),
            ],
          ),
          if (isShowPlusIcon)
            const Center(
                child: Icon(
              Icons.add,
              color: Colors.green,
            ))
        ],
      );
    }
    return PngImageAsset(
      image!,
      fit: boxFit ?? BoxFit.cover,
      color: color,
      height: height,
      width: width,
    );
  }
}
