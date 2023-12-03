import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../constant/dimens.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton(
      {super.key,
      required this.title,
      required this.bgColor,
      this.corner = 20,
      this.width = 100,
      this.trailingIconPath = "",
      this.bottomWidget,
      required this.onSubmit});

  final double width;
  final double corner;
  final Color bgColor;
  final String title;
  final String trailingIconPath;
  final Widget? bottomWidget;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: width,
          padding: const EdgeInsets.only(right: 13, left: 13, top: 5),
          height: Dimens.designHeight / 13,
          margin: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(corner), color: bgColor),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: Styles.font14PrimaryColorWeight500(),
                  ),
                  const SizedBox(width: 10),
                  if (trailingIconPath.trim().isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(trailingIconPath),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              if (bottomWidget != null) bottomWidget!
            ],
          ))),
      onTap: () async {
        onSubmit();
      },
    );
  }
}
