import 'package:flutter/material.dart';
import 'package:tasks/custom_widget/custom_icon_button.dart';
import 'package:tasks/custom_widget/item_details.dart';

import '../../custom_widget/ingredient_list_degain .dart';
import '../../model/item_model.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectQty = 1;
  String about =
      "Hot, cheesy pizza loaded with your favorite veggies is one of the most fun and easy dinners to make at home. With just a few key tips you can create a restaurant-quality crust, and treat yourself to the best homemade pizza that’s completely customizable to your tastes. Plan your next pizza party using my foolproof Pizza recipe, with step-by-step photos for making perfect and best veggie pizza from";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.orange,
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   leadingWidth: double.infinity,
            //   elevation: 0,
            //   leading: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 14),
            //     child: Row(
            //       children: [
            //         CustomIconButton(
            //             icon: Icons.arrow_back,
            //             onPressed: () {
            //               Navigator.pop(context);
            //             }),
            //         const Spacer(),
            //         CustomIconButton(icon: Icons.favorite_border, onPressed: () {}),
            //       ],
            //     ),
            //   ),
            // ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(height: MediaQuery.of(context).size.height),
                  customAppBar(),
                  productDetails(),
                  productImg()
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                isExtended: true,
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined),
                label: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "$selectQty",
                    style: TextStyle(fontSize: 10),
                  ),
                ))));
  }

  customAppBar() {
    return Container(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
        child: Row(
          children: [
            CustomIconButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                }),
            const Spacer(),
            CustomIconButton(icon: Icons.favorite_border, onPressed: () {}),
          ],
        ),
      ),
    );
  }

  productDetails() {
    return Positioned(
      top: 170,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 80),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        child: Column(children: [
          Text(
            model[widget.index].itemName.toString(),
            // "Veggie Pizza",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemDetails(
                icon: Icons.timer_outlined,
                name: '50 MIN',
                iconColor: Colors.blue,
              ),
              ItemDetails(
                icon: Icons.star,
                name: '4.5',
                iconColor: Colors.orange,
              ),
              ItemDetails(
                icon: Icons.local_fire_department,
                name: '500 KCal',
                iconColor: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                const Text(
                  "\$",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 4),
                Text(
                  " ${model[widget.index].itemPrice! * selectQty}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (selectQty > 1) {
                              selectQty--;
                            } else {
                              selectQty = 1;
                            }
                            setState(() {});
                          },
                          child: const Icon(Icons.remove, size: 18),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "$selectQty",
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w800),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (selectQty < 10) {
                              selectQty++;
                            }
                            setState(() {});
                          },
                          child: const Icon(Icons.add, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          IngredientListDesign.ingredientList(),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10),
                Text(
                  about,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  productImg() {
    return Positioned(
      left: 50,
      right: 50,
      top: 60,
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.transparent,
        child: Center(
            child:
                Image.asset(model[widget.index].img.toString(), height: 160)),
      ),
    );
  }
}
