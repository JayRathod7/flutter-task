import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static showMassage({required String msg}) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }
}
