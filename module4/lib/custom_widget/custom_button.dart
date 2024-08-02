import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all()),
        child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
