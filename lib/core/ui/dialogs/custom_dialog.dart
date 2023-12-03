import 'package:flutter/material.dart';

Widget appDialog(
    {required Widget title,
    required List<Widget> actions,
    Color color = Colors.white,
    double leftPadding = 50}) {
  return AlertDialog(
    backgroundColor: color,
    titlePadding: EdgeInsets.only(left: leftPadding, right: 10),
    actionsAlignment: MainAxisAlignment.end,
    title: title,
    actions: actions,
  );
}
