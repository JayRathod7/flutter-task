import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState()
  {
    // TODO: implement initState
    // super.initState();
    Timer(Duration(seconds: 3), ()
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainScreen()));
    });

  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Center
        (
        child:Lottie.asset('assets/Animation.json'),

      ),
    );
  }
}