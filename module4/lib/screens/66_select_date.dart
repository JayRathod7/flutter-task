import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  TextEditingController date = TextEditingController();
  String newDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Date',
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1969, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                print("new date :$newDateTime");
                newDate = newDateTime.toString();
                setState(() {});
              },
            ),
          ),
          Text(newDate)
        ],
      )),
    );
  }
}
