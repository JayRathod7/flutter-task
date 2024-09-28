import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  TextStyle urbanist = GoogleFonts.urbanist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: urbanist,
        ),
      ),
    );
  }
}
