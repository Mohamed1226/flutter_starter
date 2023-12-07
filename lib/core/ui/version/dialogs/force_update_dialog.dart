import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';

import '../../../models/app_url_model.dart';
import '../../../share_utils/sharing_utils.dart';
import '../../widgets/rounded_animated_button.dart';
import '../widgets/text_widgets.dart';

class ForceUpdateDialog extends StatelessWidget {
  final UpdateUrl updateUrl;
  final VoidCallback onDone;

  const ForceUpdateDialog(
      {Key? key, required this.updateUrl, required this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const UpdateTitleText(text: "تحديث إجباري"),
            const SizedBox(height: 16),
            const UpdateSubTitleText(
                text: "النسخه الحالية غير صالة يجب التحديث لأحدث إصدار"),
            const SizedBox(height: 32),
            RoundedAnimatedButton(
                width: 142.w,
                height: 40.h,
                borderRadius: 5,
                text: "تحديث",
                onPressed: () async {
                  try {
                    await SharingUtils.instance
                        .launchURLBrowser(url: updateUrl.value);
                  } catch (e) {}
                  context.pop();
                  onDone();
                }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
