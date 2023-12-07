import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';
import '../../app_localization/app_localization.dart';
import '../widgets/rounded_animated_button.dart';
import 'app_dialog.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String description;
  final bool showCloseIcon;

  final Function onConfirmClicked;

  const MessageDialog(
      {Key? key,
      required this.title,
      required this.description,
      this.showCloseIcon = false,
      required this.onConfirmClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // if (showCloseIcon) CloseIcon(),
            if (showCloseIcon) const SizedBox(height: 10),
            Text(
              title,
              style: Styles.font14PrimaryColorWeight500(),
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: Styles.font14PrimaryColorWeight500(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(children: [
              RoundedAnimatedButton(
                  width: 142.w,
                  text: AppLocalize.gen.ok,
                  onPressed: () async {
                    context.pop();
                    onConfirmClicked();
                  }),
              // if (showCloseText)
              //   Text(
              //     AppLocalize.gen.close,
              //     style: AppFont.appTextStyleSubtitle(
              //         fontWeight: AppFontWeight.weight_600,
              //         fontSize: AppFontSize.fontSize_14),
              //     textAlign: TextAlign.center,
              //   ),
            ]),
          ],
        ),
      ),
    );
  }

  static Future<void> show(
      {required String title,
      required String description,
      bool dismissible = true,
      bool showCloseIcon = false,
      required Function onConfirmClicked}) async {
    return AppDialogs.showAppDialog(
      content: MessageDialog(
          title: title,
          description: description,
          showCloseIcon: showCloseIcon,
          onConfirmClicked: onConfirmClicked),
      barrierDismissible: dismissible,
    );
  }
}
