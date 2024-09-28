import 'package:flutter/material.dart' show Color, Colors;
import 'package:fluttertoast/fluttertoast.dart';

Color myColor = Color(0xff00DDB3);

class CustomFunctions {
  static showToastBox(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }
}
