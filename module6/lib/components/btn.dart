import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Btn extends StatelessWidget {
  final String btnName;
  final void Function() onTap;
  const Btn({super.key, required this.btnName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              btnName,
              style: GoogleFonts.lexend(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
