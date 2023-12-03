import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import '../app_dialog.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Text(
            'نسخه سحابيه للبيانات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.ltr,
            children: [
              Text('(${(progress.toInt()).toStringAsFixed(1)}%)'),
              const Text('من فضلك إنتظر لحظات..'),
              const SizedBox(width: 20),
              CircularProgressIndicator(
                color: ColorsManager.defaultInstance.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future show({required double progress}) {
    return AppDialogs.showAppDialog(
        content: ProgressDialog(progress: progress), barrierDismissible: false);
  }
}
