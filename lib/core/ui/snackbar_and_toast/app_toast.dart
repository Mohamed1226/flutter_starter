import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../helpers/extensions/build_type_extensions.dart';

class AppToast {
  static void showToast(String msg, {Toast toast = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toast,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showDebugToast(String msg) {
    if (!BuildTypeExt.isDebug()) {
      return;
    }
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
