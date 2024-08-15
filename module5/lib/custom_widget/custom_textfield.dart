import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  TextInputType? keyboardType;
  int? maxLines;
  int? minLines;
  Widget? suffixIcon;

  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.maxLines,
      this.minLines,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: suffixIcon),
    );
  }
}
