import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';

import '74_redirect_user_2.dart';

class RedirectUser extends StatefulWidget {
  const RedirectUser({super.key});

  @override
  State<RedirectUser> createState() => _RedirectUserState();
}

class _RedirectUserState extends State<RedirectUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main screen'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Main Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                name: "Go to Next Page",
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                  // CustomFunctions.customNavigator(context, const SecondScreen());
                })
          ],
        ),
      ),
    );
  }
}
