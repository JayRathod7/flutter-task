// custom_widgets/custom_drawer.dart
import 'package:flutter/material.dart';
import '../Screen/favourite_screen.dart';
import '../Screen/rashi_screen.dart';
import '../Screen/religion_screen.dart'; // Import ReligionScreen
import '../homescreen.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onReligionSelected; // Add a callback for religion selection

  const CustomDrawer({Key? key, required this.onReligionSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 120, // Adjust height here as needed
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey, // Customize the header background color
              ),
              child: Center(
                child: Text(
                  'Baby Names',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          ListTile(
            leading: Image.asset("assets/rashi_icon.png", height: 27, width: 27),
            title: Text('Rashi'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RashiScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.temple_hindu_sharp),
            title: Text('Religion'),
            onTap: onReligionSelected, // Call the provided callback
          ),
        ],
      ),
    );
  }
}
