import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'place_holder.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final Widget? placeholder;

  final double? height;
  final double? width;

  final Alignment? alignment;

  const CachedImage(
      {required this.imageUrl,
        this.fit,
        this.placeholder,
        this.height,
        this.width,
        this.alignment});

  @override
  Widget build(BuildContext context) {
    /// TODO performance remember to trace this (or replace it with CachedNetworkImage)
    return ExtendedImage.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      cache: true,
      alignment: Alignment.center,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
          case LoadState.loading:
            return placeholder ?? const ImagePlaceHolder();
          case LoadState.completed:
            break;
        }
      },
    );
  }
}
