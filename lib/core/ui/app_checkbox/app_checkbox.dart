import 'package:flutter/material.dart';
import '../../theming/colors/colors_manager.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, this.isAgree, required this.onChanged});

  final bool? isAgree;
  final Function(bool? val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      value: isAgree,
      onChanged: (val) {
        onChanged(val);
      },
      side: const BorderSide(width: 1, color: AppFixedColors.white),
      checkColor: AppFixedColors.black,
      fillColor: MaterialStateProperty.all<Color>(
          ColorsManager.instance(context).primaryColor),
    );
  }
}
