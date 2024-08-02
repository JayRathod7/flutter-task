import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List pages = ["Gallery", "Audio", "Video"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("bottom navigation bar"),
      ),
      body: Center(
        child: Text(
          pages[selectedIndex],
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedFontSize: 16.0,
        // useLegacyColorScheme: false,
        selectedIconTheme: const IconThemeData(size: 30),
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_size_select_actual), label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: "Audio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back_outlined), label: "Videos")
        ],
      ),
    );
  }
}
