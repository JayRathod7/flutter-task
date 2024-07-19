import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

enum GroupValue { Add, Subtraction, Multiplication, Division }

class _CalculatorState extends State<Calculator> {
  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();
  var result = 0;
  bool _isCheckValue = false;

  GroupValue selectValue = GroupValue.Add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: _num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Number 1",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Number 2",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Radio(
                    value: GroupValue.Add,
                    groupValue: selectValue,
                    onChanged: (onChanged) {
                      setState(() {
                        selectValue = onChanged!;
                      });
                    }),
                Text(" (+) "),
                SizedBox(width: 2),
                Radio(
                    value: GroupValue.Subtraction,
                    groupValue: selectValue,
                    onChanged: (onChanged) {
                      setState(() {
                        selectValue = onChanged!;
                      });
                    }),
                Text(" (-) "),
                SizedBox(width: 2),
                Radio(
                    value: GroupValue.Multiplication,
                    groupValue: selectValue,
                    onChanged: (onChanged) {
                      setState(() {
                        selectValue = onChanged!;
                      });
                    }),
                Text(" (*) "),
                SizedBox(width: 2),
                Radio(
                    value: GroupValue.Division,
                    groupValue: selectValue,
                    onChanged: (onChanged) {
                      setState(() {
                        selectValue = onChanged!;
                      });
                    }),
                Text(" (/) ")
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (_num1.text.isNotEmpty && _num2.text.isNotEmpty) {
                    onPress();
                    _isCheckValue = false;
                  } else {
                    _isCheckValue = true;
                  }
                  setState(() {});
                },
                child: Text("Enter")),
            SizedBox(height: 50),
            _isCheckValue
                ? Text("Oops, something went wrong")
                : Text(
                    "It's Your Ans : $result",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
            // TextField(),
          ],
        ),
      ),
    );
  }

  void onPress() {
    int num1 = int.parse(_num1.text.toString());
    int num2 = int.parse(_num2.text.toString());
    if (selectValue == GroupValue.Add) {
      result = num1 + num2;
    } else if (selectValue == GroupValue.Subtraction) {
      result = num1 - num2;
    } else if (selectValue == GroupValue.Multiplication) {
      result = num1 * num2;
    } else if (selectValue == GroupValue.Division) {
      result = num1 ~/ num2;
    } else {
      print("Something went wrong");
    }
    setState(() {});
  }
}
