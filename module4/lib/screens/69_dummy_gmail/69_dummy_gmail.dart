import 'package:flutter/material.dart';
import 'package:module4/Model/email_model.dart';

import '../../custom_widget/custom_navigator.dart';
import 'detail_screen.dart';

class DummyGmail extends StatefulWidget {
  const DummyGmail({super.key});

  @override
  State<DummyGmail> createState() => _DummyGmailState();
}

class _DummyGmailState extends State<DummyGmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  searchBar(),
                  const SizedBox(height: 20),
                  const Text("Primary",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  emailTiles()
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomBar()),
    );
  }

  searchBar() {
    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 14, right: 14),
      // margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50)),
      child: const Row(
        children: [
          Icon(Icons.menu),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search in main",
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/photo.jpg"),
            radius: 18,
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }

  emailTiles() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        itemCount: emailModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              CustomFunctions.customNavigator(
                  context, DetailScreen(index: index));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              // color: Colors.black12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundColor: emailModel[index].color,
                    radius: 20,
                    child: Image.asset(emailModel[index].img.toString()),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          emailModel[index].name.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          emailModel[index].subject.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16),
                        ),
                        Text(
                          emailModel[index].msg.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        emailModel[index].time.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          emailModel[index].favorite =
                              !emailModel[index].favorite;
                          // !emailModel[index].favorite;
                          setState(() {});
                        },
                        icon: Icon(emailModel[index].favorite
                            ? Icons.star
                            : Icons.star_border),
                        color: emailModel[index].favorite
                            ? Colors.orange
                            : Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  bottomBar() {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.email), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back_sharp), label: "")
        ],
      ),
    );
  }
}
