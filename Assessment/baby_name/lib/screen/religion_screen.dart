// religion_screen.dart
import 'package:flutter/material.dart';

class ReligionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select Your Religion"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildReligionOption("Hindu", Icons.temple_hindu, context),
          _buildReligionOption("Christian", Icons.church, context),
          _buildReligionOption("Muslim", Icons.star, context),
        ],
      ),
    );
  }

  Widget _buildReligionOption(String name, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blueAccent),
      title: Text(name),
      onTap: () {
        Navigator.of(context).pop(name); // Pass back the selected religion
      },
    );
  }
}