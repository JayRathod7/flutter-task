import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeeProfile extends StatefulWidget {
  const SeeProfile({super.key});

  @override
  State<SeeProfile> createState() => _SeeProfileState();
}

class _SeeProfileState extends State<SeeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEe_MNtYhO1X4gUA0QuiHrnvfvgjgZHuuRbg&usqp=CAU"),
              radius: 40,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(height: 10),
            const Text(
              "Jay Rathod",
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            const Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 4,
                  color: Colors.black,
                  fontWeight: FontWeight.w200),
            ),
            const Divider(
              color: Colors.black12,
              indent: 100,
              height: 20,
              endIndent: 100,
            ),
            InkWell(
              onTap: () {
                SystemNavigator.pop();
              },
              splashColor: Colors.transparent,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text("LOGOUT")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
