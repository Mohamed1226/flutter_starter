import 'package:flutter/material.dart';

import '../screen/app_stateless.dart';
import 'images/png_image.dart';

class FullImageScreen extends AppStatelessScreen {
  final String imagePath;

  FullImageScreen({super.key, required this.imagePath});

  @override
  content() {
    return Scaffold(
      body: Center(
        child: PngImageAsset(imagePath), // your image path
      ),
    );
  }
}
