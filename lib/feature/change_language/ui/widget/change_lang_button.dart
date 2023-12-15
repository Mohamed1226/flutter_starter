import 'package:flutter/material.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';
import 'package:ready_structure/core/ui/screen/app_stateless.dart';
import 'package:ready_structure/core/ui/widgets/rounded_animated_button.dart';

class ChangeLangButton extends AppStatelessScreen {
  ChangeLangButton({super.key, required this.onPressed});

  Function onPressed;

  @override
  content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalize.gen.change_lang_desc,
          style: Styles.font14PrimaryColorWeight500(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedAnimatedButton(
              text: AppLocalize.gen.ok,
              onPressed: () {
                onPressed();
              }),
        )
      ],
    );
  }
}
