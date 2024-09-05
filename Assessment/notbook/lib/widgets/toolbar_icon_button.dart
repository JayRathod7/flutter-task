import 'package:flutter/material.dart';

Widget customIconButton(
    {required Icon icon,
    required VoidCallback onTap,
    Color? color = Colors.white,
    bool showColor = false}) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(width: 0.7),
          // color: color,
          color: color,
          gradient: showColor == true
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.pink, Colors.yellow])
              : null,
          // color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      child: icon,
    ),
  );
}
