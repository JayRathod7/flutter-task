import 'package:flutter/material.dart';

class ChangeBackground extends StatefulWidget {
  const ChangeBackground({super.key});

  @override
  State<ChangeBackground> createState() => _ChangeBackgroundState();
}

class _ChangeBackgroundState extends State<ChangeBackground> {
  bool isClick = false;
  List list = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.deepPurple,
    Colors.green,
    Colors.brown,
    Colors.deepOrange,
    Colors.amber,
    Colors.limeAccent,
    Colors.tealAccent
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change Background Color"),
      ),
      body: Container(
        // color: isClick ? Colors.green : Colors.red,
        color: list[index],
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (index == list.length - 1) {
                index = 0;
              } else {
                index++;
              }

              setState(() {
                // isClick = !isClick;
              });
            },
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
}
