import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  int sum = 0;
  NextScreen({super.key, required this.sum});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Ans"),
      ),
      body: Center(
        child: Text(
          widget.sum.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
