import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';

import '../../../models/app_url_model.dart';
import '../../../share_utils/sharing_utils.dart';
import '../../../theming/colors/colors_manager.dart';
import '../../widgets/app_primary_button.dart';
import '../../widgets/rounded_animated_button.dart';
import '../widgets/text_widgets.dart';

class OptionalUpdateDialog extends StatelessWidget {
  final UpdateUrl updateUrl;

  const OptionalUpdateDialog({Key? key, required this.updateUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const UpdateTitleText(text: "يتوفر تحديث"),
          const SizedBox(height: 16),
          const UpdateSubTitleText(
              text: "هناك تحديث جديد, الرجاء التحديث لأحدث إصدار."),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Row(
              children: [
                Expanded(
                  child: RoundedAnimatedButton(
                      width: 142.w,
                      height: 40.h,
                      text: "تحديث",
                      borderRadius: 5,
                      onPressed: () async {
                        try {
                          await SharingUtils.instance
                              .launchURLBrowser(url: updateUrl.value);
                        } catch (e) {
                          log(e.toString());
                        }
                        context.pop();
                      }),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppPrimaryButton(
                    width: 142.w,
                    height: 40.h,
                    radius: 5,
                    color: AppFixedColors.white,
                    borderColor: AppFixedColors.black.withOpacity(.5),
                    textColor: AppFixedColors.black.withOpacity(.5),
                    onPressed: () {
                      context.pop();
                    },
                    text: "ليس الآن",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
