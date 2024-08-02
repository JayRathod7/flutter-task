import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';

import 'second.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({super.key});

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summation App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _num1,
                  decoration: const InputDecoration(
                      hintText: "Enter a First number",
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _num2,
                  decoration: const InputDecoration(
                      hintText: "Enter a Second number",
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    name: "Enter",
                    onTap: () {
                      if (_num1.text.isNotEmpty && _num2.text.isNotEmpty) {
                        _sum();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sum() {
    int number1 = int.parse(_num1.text);
    int number2 = int.parse(_num2.text);
    int sum = number1 + number2;
    CustomFunctions.customNavigator(context, NextScreen(sum: sum));
  }
}
