import 'package:flutter/material.dart';

import '../../Model/email_model.dart';

class DetailScreen extends StatefulWidget {
  int index;

  DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 26),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Icon(Icons.archive_outlined),
          SizedBox(width: 20),
          Icon(Icons.delete),
          SizedBox(width: 20),
          Icon(Icons.email_outlined),
          SizedBox(width: 20),
          Icon(Icons.more_vert),
          SizedBox(width: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      emailModel[widget.index].subject.toString(),
                      style: const TextStyle(
                          fontSize: 22, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.star_border, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child:
                          Image.asset(emailModel[widget.index].img.toString()),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: emailModel[widget.index].name.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const TextSpan(
                                text: "  4 Days ago",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600))
                          ])),
                          const SizedBox(height: 6),
                          const Text(
                            "to connect  v",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text("Unsubscribe",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 4, right: 4, top: 6, bottom: 6),
                margin: const EdgeInsets.only(top: 50),
                color: Colors.black12,
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        emailModel[widget.index].subject.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Image.asset("assets/img.png"),
                      const SizedBox(height: 20),
                      Text(
                        textAlign: TextAlign.center,
                        emailModel[widget.index].msg.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
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
      ),
    ));
  }
}
