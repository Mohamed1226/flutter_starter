import 'package:flutter/material.dart';
import '../widgets/text_widgets.dart';

class UnderMaintenanceDialog extends StatelessWidget {
  final String message;

  const UnderMaintenanceDialog({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 79,
            //   ) +
            //       const EdgeInsets.only(top: 29),
            //   child: const _MaintenanceImage(),
            // ),
            const SizedBox(height: 32),
            const UpdateTitleText(text: "تحت الصيانه"),
            const SizedBox(height: 16),
            // UpdateSubTitleText(text: AppLocalize.gen.app_maintenance_subtitle),
            UpdateSubTitleText(text: message),
          ],
        ),
      ),
    );
  }
}

