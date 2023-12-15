import 'package:flutter/material.dart';
import 'package:ready_structure/core/constant/images_path.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

import '../../app_localization/app_localization.dart';
import '../../di/locator.dart';
import '../../theming/colors/colors_manager.dart';
import '../widgets/images/svg_image.dart';

abstract class AppSnackBar {
  const AppSnackBar._();

  /// Snackbar Settings
  static const bool _HIDE_UNAUTHORIZED_ERROR_SNACKBAR = false;
  static const bool _SHOW_UNDER_DEVELOPMENT_SNACKBAR = false;

  static const bool isShowSoonSnackBar = true;

  static showSuccessSnackBar({String? message}) {
    ScaffoldMessenger.of(
            locator<NavigationService>().navigatorKey.currentState!.context)
        .showSnackBar(_SuccessSnackbar(
            message: message ?? AppLocalize.gen.success_process));
  }

  static showSoonSnackBar({String? message}) {
    if (isShowSoonSnackBar) {
      ScaffoldMessenger.of(
              locator<NavigationService>().navigatorKey.currentState!.context)
          .showSnackBar(_SuccessSnackbar(
              message: message ?? AppLocalize.gen.soon));
    }
  }

  static showErrorSnackBar({String? message}) {
    ScaffoldMessenger.of(
            locator<NavigationService>().navigatorKey.currentState!.context)
        .showSnackBar(_ErrorSnackBar(
            message: message ?? AppLocalize.gen.errer_message));
  }

  static showWarningSnackBar({required String message}) {
    ScaffoldMessenger.of(
            locator<NavigationService>().navigatorKey.currentState!.context)
        .showSnackBar(_WarningSnackbar(message: message));
  }

// static showComingSoonSnackBar([BuildContext? context]) {
//   ScaffoldMessenger.of(
//           context ?? DIManager.navigator.navigationKey.currentState!.context)
//       .showSnackBar(
//           _ComingSoonSnackbar(message: AppLocalize.gen.coming_soon));
// }
}

class _SuccessSnackbar extends SnackBar {
  final String message;

  _SuccessSnackbar({Key? key, required this.message})
      : super(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            margin: EdgeInsets.only(top: 70),
            content: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppFixedColors.openGreen,
              ),
              child: Row(
                children: [
                  SvgImageAsset(ImagesPath.snackBarCheck),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      message,
                      //textAlign: TextAlign.left,
                      style: Styles.font14PrimaryColorWeight500(
                        fontSize: AppFontSize.fontSize_14,
                        fontWeight: AppFontWeight.weight_400,
                      ),
                    ),
                  ),
                ],
              ),
            ));
}

class _ErrorSnackBar extends SnackBar {
  final String message;

  _ErrorSnackBar({Key? key, required this.message})
      : super(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            margin: EdgeInsets.only(top: 70),
            content: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppFixedColors.red,
              ),
              child: Row(
                children: [
                  SvgImageAsset(ImagesPath.snackBarError),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      message,
                      //textAlign: TextAlign.left,
                      style: Styles.font14PrimaryColorWeight500(
                        fontSize: AppFontSize.fontSize_14,
                        fontWeight: AppFontWeight.weight_400,
                      ),
                    ),
                  ),
                ],
              ),
            ));
}

class _WarningSnackbar extends SnackBar {
  final String message;
  final VoidCallback? callback;

  _WarningSnackbar({Key? key, required this.message, this.callback})
      : super(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.fixed,
            content: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppFixedColors.openYellow,
              ),
              child: Row(
                children: [
                  SvgImageAsset(ImagesPath.snackBarWarning),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      message,
                      //    textAlign: TextAlign.left,
                      style: Styles.font14PrimaryColorWeight500(
                        fontSize: AppFontSize.fontSize_14,
                        fontWeight: AppFontWeight.weight_400,
                      ),
                    ),
                  ),
                  // if (callback != null)
                  //   Row(
                  //     children: [
                  //       SizedBox(width: 12),
                  //       AppTextButton.fromString(
                  //           onPressed: callback,
                  //           text: AppLocalize.gen.retry,
                  //           textStyle: AppFont.appTextStyleTitle(
                  //             fontFamily: AppFont.fontFamily,
                  //             color: Colors.white70,
                  //             fontSize: AppFontSize.fontSize_14,
                  //             fontWeight: AppFontWeight.weight_600,
                  //           )),
                  //     ],
                  //   )
                ],
              ),
            ));
}

class _ComingSoonSnackbar extends SnackBar {
  final String message;

  _ComingSoonSnackbar({Key? key, required this.message})
      : super(
            key: key,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.fixed,
            content: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.pink,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.left,
                      style: Styles.font14PrimaryColorWeight500(
                        fontSize: AppFontSize.fontSize_14,
                        fontWeight: AppFontWeight.weight_400,
                      ),
                    ),
                  ),
                ],
              ),
            ));
}
