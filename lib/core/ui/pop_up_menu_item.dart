import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import 'widgets/images/png_image.dart';

class AppPopUpMenuItem extends StatelessWidget {
  const AppPopUpMenuItem(
      {Key? key,
      required this.title,
      required this.iconPath,
      required this.color,
      required this.onTapped})
      : super(key: key);

  final String title, iconPath;
  final Color color;

  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Row(
        children: [
          PngImageAsset(iconPath, color: color),
          const SizedBox(
            width: 13,
          ),
          Text(
            title,
            style: Styles.font14PrimaryColorWeight500(),
          )
        ],
      ),
    );
  }
}
