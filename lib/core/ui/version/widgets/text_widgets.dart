import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

class UpdateTitleText extends StatelessWidget {
  final String text;

  const UpdateTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.font14PrimaryColorWeight500(),
    );
  }
}

class UpdateSubTitleText extends StatelessWidget {
  final String text;

  const UpdateSubTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Styles.font14PrimaryColorWeight500(),
      ),
    );
  }
}
