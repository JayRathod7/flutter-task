import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';

import 'model.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  List finalList = [];
  late var lastPrice;
  int selectQty = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finalList = ItemModel.categoryList;
    lastPrice = ItemModel.finalTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Text("Cart",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: finalList.isEmpty
                    ? const Center(
                        child: Text(
                          "Cart is Empty",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Thu, 6th of June",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          const Text(
                            "+ Add to Order",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            itemCount: finalList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(
                                    top: 0, bottom: 0, right: 10, left: 10),
                                // tileColor: Colors.orange,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    // "assets/food1.png",
                                    finalList[index].img,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      finalList[index].name,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {},
                                        ),
                                        Text(selectQty.toString()),
                                        IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {}),
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('₹ ${finalList[index].price}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                    const SizedBox(height: 6),
                                    InkWell(
                                      onTap: () {
                                        lastPrice =
                                            lastPrice - finalList[index].price;
                                        finalList.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(Icons.remove,
                                            color: Colors.black, size: 20),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 50),
              finalList.isEmpty
                  ? const SizedBox()
                  : SizedBox(
                      child: Column(
                        children: [
                          const Divider(),
                          Row(children: [
                            const Text(
                              "Total :",
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            const Spacer(),
                            Text("₹ $lastPrice",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 36))
                          ]),
                          const SizedBox(height: 10),
                          Center(
                              child: CustomButton(
                                  name: "Check Out ",
                                  onTap: () {
                                    CustomFunctions.customToast(
                                        "Order Done", Colors.black);
                                    finalList.clear();
                                    setState(() {});
                                  }))
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
