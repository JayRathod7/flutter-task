import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/userTile.dart';
import '../service/auth/auth_services.dart';
import '../service/chat/chat_services.dart';
import '../utils/colors.dart';
import 'chatpage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  TextStyle urbanist =
      GoogleFonts.urbanist(color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: Text("Hello chat!"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
      stream: chatService.getUserStream(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Text("Error");
        }

        return ListView(
          children: snapshot.data!
              .map((userData) => buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget buildUserListItem(
      Map<String, dynamic> userdata, BuildContext context) {
    if (userdata['email'] != authService.getCurrentUser()!.email) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: userTile(
            text: userdata['email'],
            id: userdata['uid'],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      recieverEmail: userdata['email'],
                      recieverID: userdata['uid'],
                    ),
                  ));
            }),
      );
    } else {
      return Container();
    }
  }
}
