import 'package:flutter/material.dart';

class DisplayTextCheckbox extends StatefulWidget {
  const DisplayTextCheckbox({super.key});

  @override
  State<DisplayTextCheckbox> createState() => _DisplayTextCheckboxState();
}

class _DisplayTextCheckboxState extends State<DisplayTextCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Text When Click on CheckBox"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: _isChecked,
                onChanged: (onChanged) {
                  setState(() {
                    setState(() {
                      _isChecked = !_isChecked;
                    });
                  });
                }),
            SizedBox(height: 10),
            _isChecked
                ? Text(
                    "How Are You ? ..",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blue),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
