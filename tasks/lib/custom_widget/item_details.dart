import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  const ItemDetails(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
        SizedBox(width: 2),
        Text(name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
      ],
    );
  }
}
