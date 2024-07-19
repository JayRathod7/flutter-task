import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  final String name;

  const CustomButton({super.key, required this.widget, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget));
          },
          child: Text(
            name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
