import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final String? errorText;

  const MyTextField(
      {super.key,
      required this.hintText,
      this.obscureText,
      this.errorText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      // child: TextField(
      //   controller: controller,
      //   obscureText: obscureText,
      //   decoration: InputDecoration(
      //       hintText: hintText,
      //       hintStyle: TextStyle(color: Colors.black),
      //       filled: true,
      //       border:
      //           OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      // ),
    );
  }
}
