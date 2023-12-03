import 'package:flutter/material.dart';

import '../../theming/colors/colors_manager.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Divider(
        color: ColorsManager.instance(context).primaryColor.withOpacity(.25),
      ),
    );
  }
}
