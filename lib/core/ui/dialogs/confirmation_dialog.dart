import 'package:flutter/material.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';

import '../../app_localization/app_localization.dart';
import '../../theming/colors/colors_manager.dart';
import '../../theming/styles/fonts.dart';
import '../widgets/app_primary_button.dart';

class ConfirmationDialogWidget<T> extends StatelessWidget {
  const ConfirmationDialogWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.onConfirm,
      required this.confirmText,
      this.cancelText,
      this.color})
      : super(key: key);

  final T? Function() onConfirm;
  final String title;
  final String description;
  final String confirmText;
  final String? cancelText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.font14PrimaryColorWeight500(),
          ),
          const SizedBox(
            height: 26,
          ),
          Text(
            description,
            style: Styles.font14PrimaryColorWeight500(),
          ),
          const SizedBox(height: 36),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppPrimaryButton(
                text: cancelText ?? AppLocalize.gen.cancel,
                //radius: 24,
                width: 80,
                height: 40,
                textColor: ColorsManager.defaultInstance.primaryColor,
                color: AppFixedColors.transparent,
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(
                width: 23,
              ),
              AppPrimaryButton(
                text: confirmText,
                radius: 24,
                width: 80,
                height: 40,
                color: ColorsManager.defaultInstance.primaryColor,
                onPressed: onConfirm,
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
