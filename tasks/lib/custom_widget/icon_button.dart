import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final String img;
  final String name;
  const CustomIconBtn({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(img),
        )),
        Text(
          name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
