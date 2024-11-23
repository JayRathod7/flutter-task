import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onRefreshPressed;
  final VoidCallback onFavoritePressed;


  const CustomAppBar({
    required this.title,
    required this.onRefreshPressed,
    required this.onFavoritePressed,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueGrey,
      elevation: 8.0,
      actions: [
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.white),
          onPressed: onRefreshPressed,
        ),
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: onFavoritePressed,
        ),

      ],
    );
  }
}
