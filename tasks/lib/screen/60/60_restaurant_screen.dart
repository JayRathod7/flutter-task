import 'package:flutter/material.dart';
import 'package:tasks/custom_widget/custom_icon_button.dart';
import 'package:tasks/screen/60/60_detail_screen.dart';

import '../../model/item_model.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List itemList = [
    "Recommend",
    "Popular",
    "Noodles",
    "Pizza",
    "Burger",
    "Coffee"
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      //         CustomIconButton(icon: Icons.search, onPressed: () {}),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 26, right: 26),
        child: Column(
          children: [
            Row(
              children: [
                CustomIconButton(
                    icon: Icons.arrow_back,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Spacer(),
                CustomIconButton(icon: Icons.search, onPressed: () {}),
              ],
            ),
            const SizedBox(height: 60),
            restaurantTitle(),
            const SizedBox(height: 16),
            horizontalMenu(),
            const SizedBox(height: 2),
            mainItem(),
            const SizedBox(height: 10),
            dotIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.shopping_bag_outlined, size: 18),
        onPressed: () {},
      ),
    );
  }

  restaurantTitle() => Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Restaurant",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black12),
                    child: const Text(
                      "20-30 Min",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "2.4 KM ",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Restaurant",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                "vegetable sandwich is delcious",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 14),
              Card(
                color: Colors.white,
                margin: EdgeInsets.zero,
                child: Image.asset("assets/logo.png", height: 70, width: 70),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.star_border, color: Colors.orange),
                  Text("4.9",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black))
                ],
              )
            ],
          )
        ],
      );

  horizontalMenu() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                selectIndex = index;
                setState(() {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                // margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: const EdgeInsets.only(
                    top: 2, bottom: 10, left: 4, right: 4),
                decoration: BoxDecoration(
                    color: selectIndex == index ? Colors.orange : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: Text(
                  itemList[index],
                  style: TextStyle(
                      color: selectIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          itemCount: itemList.length,
        ),
      );

  mainItem() => Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: model.length,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                index: index,
                              )));
                },
                child: Card(
                  color: Colors.white,
                  child: Container(
                    height: 120,
                    // color: Colors.orange,
                    padding: const EdgeInsets.only(
                        left: 10, top: 16, bottom: 16, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          // child: Image.asset(model[index].img)
                          child: Image.asset(model[index].img.toString()),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              model[index].itemName.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text(
                              model[index].rating.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                  fontSize: 14),
                            ),
                            Text(
                              model[index].itemPrice.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.navigate_next_outlined)
                      ],
                    ),
                  ),
                ),
              );
            }),
      );

  dotIndicator() => SizedBox(
        height: 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: selectIndex == index ? 16.0 : 10.0,
                height: selectIndex == index ? 16.0 : 10.0,
                decoration: selectIndex == index
                    ? BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.orange,
                            width: 1,
                            style: BorderStyle.solid),
                        shape: BoxShape.circle,
                      )
                    : const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ));
          },
          itemCount: itemList.length,
        ),
      );
}
