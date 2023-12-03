import 'package:flutter/material.dart';
import 'package:ready_structure/core/constant/images_path.dart';

import 'png_image.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PngImageAsset(
      ImagesPath.imagePlaceHolder,
      fit: BoxFit.cover,
    );
  }
}
