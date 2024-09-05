import 'package:flutter/material.dart';
import '../helper_class/string.dart';

PreferredSizeWidget appBar({BuildContext? context, isSelected = false}) =>
    AppBar(
      title: Text(
        AppString.appLabel,
        style: const TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.pink, Colors.yellow])),
      ),
    );
