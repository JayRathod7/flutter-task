import 'package:flutter/material.dart';

class IngredientListDesign extends StatelessWidget {
  final String img;
  final String name;

  const IngredientListDesign(
      {super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(img, height: 40),
          // CircleAvatar(
          //   radius: 24,
          //   backgroundColor: Colors.transparent,
          //   backgroundImage: AssetImage(img),
          // ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  static ingredientList() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredient",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IngredientListDesign(name: "Noodle", img: "assets/ingre1.png"),
              IngredientListDesign(name: "shrimp", img: "assets/ingre2.png"),
              IngredientListDesign(name: "Egg", img: "assets/ingre3.png"),
              IngredientListDesign(name: "Scallion", img: "assets/ingre4.png"),
            ],
          ),
        ],
      ),
    );
  }
}
