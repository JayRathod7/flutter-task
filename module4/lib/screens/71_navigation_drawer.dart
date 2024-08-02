import 'package:flutter/material.dart';

class NavigationDrawerEx extends StatefulWidget {
  const NavigationDrawerEx({super.key});

  @override
  State<NavigationDrawerEx> createState() => _NavigationDrawerExState();
}

class _NavigationDrawerExState extends State<NavigationDrawerEx> {
  List<Model> drawerTiles = [
    Model(icon: Icons.photo_size_select_actual_outlined, name: "Gallery"),
    Model(icon: Icons.audiotrack, name: "Audio"),
    Model(icon: Icons.video_camera_back_outlined, name: "Video"),
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Navigation Drawer")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(drawerTiles[selectIndex].icon, size: 30),
              Text(
                drawerTiles[selectIndex].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: NavigationDrawer(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 10, top: 10, right: 10),
                height: 100,
                color: Colors.black,
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage("assets/photo.jpg"),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                            style: TextStyle(color: Colors.white),
                            TextSpan(children: [
                              TextSpan(
                                  text: "Name : ",
                                  style: TextStyle(fontSize: 16)),
                              TextSpan(
                                  text: "Welcome Guest",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800))
                            ])),
                        Text.rich(
                            style: TextStyle(color: Colors.white),
                            TextSpan(children: [
                              TextSpan(children: [
                                TextSpan(
                                    text: "Email : ",
                                    style: TextStyle(fontSize: 14)),
                                TextSpan(
                                    text: "Example@gmail.com",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800))
                              ])
                            ])),
                      ],
                    )
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: drawerTiles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectIndex = index;
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Container(
                        color: selectIndex == index
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.transparent,
                        padding: const EdgeInsets.only(
                            left: 22, top: 10, bottom: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(drawerTiles[index].icon,
                                size: 34,
                                color: selectIndex == index
                                    ? Colors.orange
                                    : Colors.black54),
                            const SizedBox(width: 26),
                            Text(
                              drawerTiles[index].name,
                              style: TextStyle(
                                  color: selectIndex == index
                                      ? Colors.orange
                                      : Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}

class Model {
  final IconData icon;
  final String name;

  Model({required this.icon, required this.name});
}
