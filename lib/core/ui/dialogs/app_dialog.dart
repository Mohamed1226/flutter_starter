import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/ui/cubit/application_cubit.dart';
import 'package:ready_structure/core/constant/images_path.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../app_localization/app_localization.dart';
import '../../models/app_url_model.dart';
import '../../theming/colors/colors_manager.dart';
import '../app_checkbox/app_checkbox.dart';
import '../app_transparent_button.dart';
import '../version/dialogs/force_update_dialog.dart';
import '../version/dialogs/optional_update_dialog.dart';
import '../version/dialogs/under_maintainance_dialog.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/images/png_image.dart';

abstract class AppDialogs {
  static Future<T?> showTowButtonsDialog<T>({
    required BuildContext context,
    required List<Widget> children,
    String? secondaryBtnString,
    String? actionBtnString,
    required VoidCallback onSecondaryPressed,
    required VoidCallback onPrimaryPressed,
    bool barrierDismissible = true,
  }) {
    return showAppDialog(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 32),
              ...children,
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: TransparentButton(
                        onPressed: () {
                          onPrimaryPressed();
                        },
                        textChild: Text(
                          actionBtnString ?? AppLocalize.gen.ok,
                          style: Styles.font14PrimaryColorWeight500(
                            fontWeight: AppFontWeight.weight_400,
                            fontSize: AppFontSize.fontSize_14,
                          ),
                        ),
                        color: AppFixedColors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                    child: VerticalDivider(
                      width: 12,
                      endIndent: 0,
                      indent: 0,
                      thickness: 1.h,
                      color: Color(0xffE7E7E7),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TransparentButton(
                        textChild: Text(
                          secondaryBtnString ?? AppLocalize.gen.cancel,
                          style: Styles.font14PrimaryColorWeight500(
                            fontWeight: AppFontWeight.weight_400,
                            fontSize: AppFontSize.fontSize_14,
                            color: AppFixedColors.red,
                          ),
                        ),
                        color: AppFixedColors.transparent,
                        onPressed: () {
                          onSecondaryPressed();
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        barrierDismissible: barrierDismissible);
  }

  static Future<T?> showAppDialog<T>(
      {bool barrierDismissible = true,
      required Widget content,
      String? routeName}) async {
    return showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: ApplicationCubit.context!,
      builder: (BuildContext context) {
        final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: BackdropFilter(
            filter: Styles.blur,
            child: AlertDialog(
              elevation: 0.0,
              content: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [content],
                ),
              ),
              backgroundColor: ColorsManager.instance(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showFreeDialog<T>(
      {bool barrierDismissible = true,
      required Widget content,
      Color? barrierColor}) async {
    return showDialog<T>(
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      context: ApplicationCubit.context!,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: Styles.blur1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [content],
          ),
        );
      },
    );
  }

  static Future<void> showSuccessFeedBackDialog(
      {required String message, required String description}) async {
    return await showAppDialog(
        barrierDismissible: false,
        content: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ));
  }

  static Future<void> showSuccessDialog(
      {required String message, required BuildContext context}) async {
    return await showAppDialog(
        barrierDismissible: false,
        content: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ));
  }

  static Future<bool?> showConfirmDeleteDialog(
      {required String title,
      required String desc,
      String? imagePath,
      required BuildContext context}) async {
    bool isAgree = false;
    return await showAppDialog(
        barrierDismissible: false,
        content: StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imagePath != null) const PngImageAsset(ImagesPath.warning),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  title,
                  style: Styles.font14PrimaryColorWeight500(
                      fontWeight: AppFontWeight.weight_700,
                      fontSize: AppFontSize.fontSize_16),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc,
                  style: Styles.font14PrimaryColorWeight500(
                    fontWeight: AppFontWeight.weight_400,
                    fontSize: AppFontSize.fontSize_14,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "اذا ضغطت علي الايكون يعني انك موافق على حذف البيانات كليا ",
                      style: Styles.font14PrimaryColorWeight500(
                          fontWeight: AppFontWeight.weight_400,
                          fontSize: AppFontSize.fontSize_14,
                          color: AppFixedColors.red),
                    )),
                    AppCheckBox(
                        isAgree: isAgree,
                        onChanged: (val) {
                          isAgree = val!;
                          setState(() {});
                        }),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppPrimaryButton(
                      text: AppLocalize.gen.delete,
                      isClickable: isAgree,
                      onPressed: () {
                        context.pop(true);
                      },
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: AppPrimaryButton(
                      text: AppLocalize.gen.cancel,
                      onPressed: () {
                        context.pop(false);
                      },
                    )),
                  ],
                )
              ],
            ),
          );
        }));
  }

  static Future<void> showForceUpdateDialog(
      {required UpdateUrl updateUrl, required VoidCallback onDone}) async {
    return showAppDialog(
      content: ForceUpdateDialog(
        updateUrl: updateUrl,
        onDone: onDone,
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> showUnderMaintenanceDialog(
      {required String underMaintenanceMessage}) async {
    return showAppDialog(
      content: UnderMaintenanceDialog(message: underMaintenanceMessage),
      barrierDismissible: false,
    );
  }

  static Future<void> showOptionalUpdateDialog(
      {required UpdateUrl updateUrl}) async {
    return showAppDialog(
      content: OptionalUpdateDialog(updateUrl: updateUrl),
      barrierDismissible: false,
    );
  }
}
