import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox {
  static customDialog(
      {required BuildContext context,
      required Widget title,
      required Widget content,
      List<Widget>? actions}) {
    return showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: actions,
          );
        });
  }
}
