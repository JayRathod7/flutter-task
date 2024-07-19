import 'package:flutter/material.dart';

class ReverseNumber extends StatefulWidget {
  const ReverseNumber({super.key});

  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

class _ReverseNumberState extends State<ReverseNumber> {
  TextEditingController number = TextEditingController();
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse NUmber"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: number,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter Number", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  GetReverse();
                  // number.clear();
                  setState(() {});
                },
                child: Text("Get Reverse")),
            SizedBox(height: 20),
            Text(
              "Reverse Number Is $result",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  void GetReverse() {
    int _number = int.parse(number.text.toString());
    int getNumber;
    int reverse = 0;

    while (_number != 0) {
      getNumber = _number % 10;
      _number = _number ~/ 10;
      reverse = (reverse * 10) + getNumber;
    }
    result = reverse.toString();
  }
}
