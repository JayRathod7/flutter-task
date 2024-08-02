import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_navigator.dart';

import '../../custom_widget/custom_button.dart';
import '74_redirect_user.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Second Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                name: "Go to previous page",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RedirectUser()));
                  CustomFunctions.customNavigator(
                      context, const RedirectUser());
                })
          ],
        ),
      ),
    );
  }
}
