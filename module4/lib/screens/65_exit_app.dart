import 'dart:io';

import 'package:flutter/material.dart';

import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_navigator.dart';

class ExitApp extends StatefulWidget {
  const ExitApp({super.key});

  @override
  State<ExitApp> createState() => _ExitAppState();
}

class _ExitAppState extends State<ExitApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exit App"),
      ),
      body: Center(
        child: CustomButton(
            name: "Exit",
            onTap: () {
              showBox();
            }),
      ),
    );
  }

  showBox() {
    CustomFunctions.customDialog(
        context: context,
        title: const Text("Exit"),
        content: const Text("Are you sure you want to exit the app?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("CANCEL")),
          TextButton(
              onPressed: () {
                exit(0);
                // SystemNavigator.pop();
              },
              child: const Text("OKAY")),
        ]);
  }
}
