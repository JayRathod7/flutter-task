import 'package:flutter/material.dart';

class RadioButtonEx extends StatefulWidget {
  const RadioButtonEx({super.key});

  @override
  State<RadioButtonEx> createState() => _RadioButtonExState();
}

class _RadioButtonExState extends State<RadioButtonEx> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text("Colors Change")),
      body: Column(
        children: [
          RadioListTile(
              title: Text("Green"),
              value: Colors.green,
              groupValue: color,
              onChanged: (onChanged) {
                setState(() {
                  color = onChanged!;
                });
              }),
          RadioListTile(
              title: Text("Red"),
              value: Colors.red,
              groupValue: color,
              onChanged: (onChanged) {
                setState(() {
                  color = onChanged!;
                });
              }),
          RadioListTile(
              title: Text("Yellow"),
              value: Colors.yellow,
              groupValue: color,
              onChanged: (onChanged) {
                setState(() {
                  color = onChanged!;
                });
              }),
          RadioListTile(
              title: Text("Pink"),
              value: Colors.pink,
              groupValue: color,
              onChanged: (onChanged) {
                setState(() {
                  color = onChanged!;
                });
              }),
          RadioListTile(
              title: Text("Blue"),
              value: Colors.blueAccent,
              groupValue: color,
              onChanged: (onChanged) {
                setState(() {
                  color = onChanged!;
                });
              }),
        ],
      ),
    );
  }
}
