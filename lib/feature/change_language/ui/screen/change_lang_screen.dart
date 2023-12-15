import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/ui/screen/app_statefull.dart';
import 'package:ready_structure/feature/change_language/ui/cubit/chnage_lang_cubit.dart';
import 'package:ready_structure/feature/change_language/ui/widget/change_lang_button.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({super.key});

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState
    extends AppScreen<ChangeLangScreen, ChangeLangCubit> {
  @override
  Widget content() {
    return blocConsumer(builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorsManager.instance(context).primaryColor,
        body: ChangeLangButton(onPressed: () {
          cubit.changeLanguage();
        }),
      );
    });
  }

  @override
  onInitState() {}
}
