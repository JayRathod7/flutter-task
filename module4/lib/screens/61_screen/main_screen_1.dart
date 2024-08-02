import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';
import 'package:module4/screens/61_screen/model.dart';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1> {
  List hotelName = [
    "Sankalp Restaurant",
    "TGT",
    "Tea Post",
    "Subway",
    "Jassi De Parathe",
    "Pizza Hut",
    "Urban",
    "Platinum Hotel",
    "Honest Restaurant",
    "Waves",
    "Saraza",
  ];
  List itemName = [
    "All",
    "Pav bhaji",
    "Pizza",
    "Dosa",
    "sweets",
    "Burger",
    "dragon potato",
    "potato fingers",
    "Veg Momos",
    "Kachori",
    "Samosa",
    "Mix Bhel"
  ];
  int selectedHotelIndex = 0;
  int selectedItemIndex = 0;

  // static int total = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  const Text("Menu",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        bottomSheet();
                      },
                      icon: const Icon(Icons.filter_alt)),
                ],
              ),
              const SizedBox(height: 10),
              hotelNameWidget(),
              const SizedBox(height: 0),
              itemNameWidget(),
              GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mainMenu.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(mainMenu[index].img,
                                    fit: BoxFit.fill),
                              )),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          // color: Colors.pink,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Text(mainMenu[index].name,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const RatingStars(
                                    value: 3.5,
                                    starCount: 5,
                                    starSize: 16,
                                    valueLabelVisibility: false,
                                    starColor: Colors.orange,
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      "4.0",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text("₹ ${mainMenu[index].price}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900)),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      if (ItemModel.categoryList.isEmpty) {
                                        ItemModel.finalTotal = 0;
                                      }
                                      ItemModel.categoryList
                                          .add(mainMenu[index]);
                                      CustomFunctions.customToast(
                                          "Item Added", Colors.black);
                                      total = ItemModel.finalTotal;
                                      total = mainMenu[index].price + total;
                                      print("final total : $index :$total");
                                      ItemModel.finalTotal = total;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add,
                                          color: Colors.black, size: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  hotelNameWidget() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: hotelName.length,
          // padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectedHotelIndex = index;
                setState(() {});
              },
              splashColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: selectedHotelIndex == index
                        ? Colors.orangeAccent
                        : Colors.black12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    hotelName[index],
                    style: TextStyle(
                        fontSize: selectedHotelIndex == index ? 18 : 16,
                        fontWeight: selectedHotelIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }

  itemNameWidget() {
    return SizedBox(
      height: 40,
      // padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: itemName.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectedItemIndex = index;
                setState(() {});
              },
              splashColor: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 0),
                  child: Text(
                    itemName[index],
                    style: TextStyle(
                        color: selectedItemIndex == index
                            ? Colors.black
                            : Colors.black54,
                        fontSize: selectedItemIndex == index ? 18 : 14,
                        fontWeight: selectedItemIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }

  bottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 10,
                  indent: 100,
                  endIndent: 100,
                  thickness: 6,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Order',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.food_bank,
                      size: 30,
                    )
                  ],
                ),
                // SizedBox(height: 20),
                const ListTile(
                  title: Text(
                    "Chiken Burger",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '250 g',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Text(
                    '₹ 7.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(),
                const ListTile(
                  title: Text(
                    "Avacado Salad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('350 g',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  trailing: Text(
                    '₹ 5.22',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // const SizedBox(height: 10),
                Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹ 12.22',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CustomButton(name: "Add To Cart", onTap: () {})
              ],
            ),
          );
        });
  }
}
