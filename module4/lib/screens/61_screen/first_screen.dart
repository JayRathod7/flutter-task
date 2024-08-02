import 'package:flutter/material.dart';
import 'package:module4/screens/61_screen/main_screen_1.dart';
import 'package:module4/screens/61_screen/main_screen_2.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List screen = [const MainScreen1(), const MainScreen2()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart")
        ],
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
      ),
      body: screen[_selectedIndex],
    );
  }
}
