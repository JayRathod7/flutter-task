import 'package:flutter/material.dart';

class SeekBarEx extends StatefulWidget {
  const SeekBarEx({super.key});

  @override
  State<SeekBarEx> createState() => _SeekBarExState();
}

class _SeekBarExState extends State<SeekBarEx> {
  double val1 = 0.0;
  double val2 = 0.0;
  double val3 = 0.0;

  @override
  Widget build(BuildContext context) {
    Color bgColor = Color.fromRGBO(val1.toInt(), val2.toInt(), val3.toInt(), 1);
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text('sick bar'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Change Background COlors",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Slider(
                  min: 0,
                  max: 255,
                  value: val1,
                  onChanged: (onChanged) {
                    val1 = onChanged;
                    setState(() {});
                  }),
              Slider(
                  min: 0,
                  max: 255,
                  value: val2,
                  onChanged: (onChanged) {
                    val2 = onChanged;
                    setState(() {});
                  }),
              Slider(
                  min: 0,
                  max: 255,
                  value: val3,
                  onChanged: (onChanged) {
                    val3 = onChanged;
                    setState(() {});
                  }),
            ],
          ),
        ));
  }
}
