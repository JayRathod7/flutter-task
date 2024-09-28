import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module6/screen/home.dart';
import 'package:module6/service/auth/login_or_register.dart';

class AuthDoor extends StatelessWidget {
  const AuthDoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginOrRegister();
            }
          }
        },
      ),
    );
  }
}
