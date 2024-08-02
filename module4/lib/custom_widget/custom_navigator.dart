import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomFunctions {
  static customNavigator(BuildContext context, Widget name) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return name;
    }));
  }

  static customToast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: color, toastLength: Toast.LENGTH_SHORT);
  }

  static customDialog(
      {required BuildContext context,
      required Widget title,
      required Widget content,
      List<Widget>? actions}) {
    return showDialog(
        barrierDismissible: false,
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
