import 'package:flutter/material.dart';
import 'package:ready_structure/core/constant/dimens.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({Key? key, this.title, this.widgetNextTitle,this.actions})
      : super(key: key);
  final String? title;
  final Widget? widgetNextTitle;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size(Dimens.designWidth, (64));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorsManager.instance(context).primaryColor,
      title: Row(children: [
        if (title != null)
          Text(
            title!,
            style:  Styles.font14PrimaryColorWeight500(),
          ),
        const SizedBox(width: 8),
        if (widgetNextTitle != null) widgetNextTitle!
      ]),
      actions: actions != null ? actions! : null,
    );
  }
}
