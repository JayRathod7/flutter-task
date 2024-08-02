import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:module4/screens/67_see_profile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SeeProfile())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Dairy Market",
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold)),
          const Text("Best Quality in Milk,Ghee,Curd,\nPaneer & Butter",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold)),
          Lottie.asset("assets/lotti.json", repeat: true),
        ],
      )),
    );
  }
}
