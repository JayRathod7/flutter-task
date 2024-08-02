import 'package:flutter/material.dart';

import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_navigator.dart';

class ToastExample extends StatefulWidget {
  const ToastExample({super.key});

  @override
  State<ToastExample> createState() => _ToastExampleState();
}

class _ToastExampleState extends State<ToastExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Toast"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              name: "Positive",
              onTap: () {
                CustomFunctions.customToast(
                    "This is Positive Button", Colors.green);
              }),
          CustomButton(
              name: "Neutral",
              onTap: () {
                CustomFunctions.customToast(
                    "This is Neutral Button", Colors.blue);
              }),
          CustomButton(
              name: "Negative",
              onTap: () {
                CustomFunctions.customToast(
                    "This is Negative Button", Colors.red);
              }),
        ],
      )),
    );
  }
}
