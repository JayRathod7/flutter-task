import 'package:flutter/material.dart';

import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_navigator.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  String selectCity = '';
  List<String> city = [
    'Rajkot',
    'Ahmadabad',
    "Kutchh",
    'Botad',
    'Vadodara',
    'Junagadh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show And Select City"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                name: "Select City",
                onTap: () {
                  showBox();
                }),
            const SizedBox(height: 20),
            Text(
              selectCity,
              style: const TextStyle(
                  color: Colors.pink, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }

  showBox() {
    CustomFunctions.customDialog(
        context: context,
        title: Row(
          children: [
            const Text("Cities"),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: city.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.purple,
                  onTap: () {
                    selectCity = city[index];
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        city[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
