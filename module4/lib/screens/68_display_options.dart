import 'package:flutter/material.dart';

import '../custom_widget/custom_navigator.dart';

class DisplayOptions extends StatefulWidget {
  const DisplayOptions({super.key});

  @override
  State<DisplayOptions> createState() => _DisplayOptionsState();
}

class _DisplayOptionsState extends State<DisplayOptions> {
  List<String> menu = [
    "Vada pav",
    "Panipuri",
    "Samosa",
    "Aloo tikki",
    "Pav bhaji",
    "Dabeli",
    "Hamburger",
    "Cheeseburger",
    "Sandwich",
    "Milkshake",
    "Muffin",
    "Burrito",
    "Taco",
    "Hot dog",
    "Fried chicken",
    "Donuts",
    "Soft drink",
    "Pizza",
    "Onion ring",
    "Pancake",
    "Bacon",
    "Chip",
    "Noodle"
  ];

  final TextEditingController _editItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MENU"),
      ),
      body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.orange,
              padding:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 10),
              margin:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 10),
              child: Row(
                children: [
                  Text(
                    index.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    menu[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      editItem(index);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteItem(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  deleteItem(int index) {
    CustomFunctions.customDialog(
        context: context,
        title: const Text("Delete"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("CANCEL")),
          TextButton(
              onPressed: () {
                setState(() {
                  CustomFunctions.customToast(
                      "Removed ${menu[index]}  from the menu", Colors.black);
                  menu.removeAt(index);
                });

                Navigator.pop(context);
              },
              child: const Text("DELETE")),
        ]);
  }

  editItem(int index) {
    _editItem.text = menu[index];
    CustomFunctions.customDialog(
        context: context,
        title: Row(
          children: [
            const Text("Update Item"),
            Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: TextField(
            controller: _editItem,
            decoration: const InputDecoration(border: OutlineInputBorder())),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("CANCEL")),
          TextButton(
              onPressed: () {
                String newValue = _editItem.text.trim();
                menu[index] = newValue;
                setState(() {});

                Navigator.pop(context);
              },
              child: const Text("UPDATE")),
        ]);
  }
}
