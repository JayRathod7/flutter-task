import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/chatBubble.dart';
import '../service/auth/auth_services.dart';
import '../service/chat/chat_services.dart';
import '../utils/colors.dart';

class ChatPage extends StatefulWidget {
  final String recieverEmail;
  final String recieverID;

  ChatPage({
    super.key,
    required this.recieverEmail,
    required this.recieverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextStyle urbanist = GoogleFonts.urbanist();
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();
  FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      Future.delayed(Duration(milliseconds: 500), () => scrollDown());
    });

    Future.delayed(Duration(milliseconds: 100), () => scrollDown());
  }

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(widget.recieverID, messageController.text);
      messageController.clear();
    }
    scrollDown();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    messageController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recieverEmail.split('@')[0],
          style: GoogleFonts.lexend(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          userInput(),
          SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatService.getMessages(widget.recieverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return SpinKitSpinningLines(
            //   color: myColor,
            //   size: 70,
            // );

            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData == false) {
            return Center(child: Text("Say Hi"));
          }

          return ListView(
            controller: scrollController,
            children: snapshot.data!.docs
                .map((doc) => buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget userInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
                hintStyle: GoogleFonts.lexend(color: Colors.grey),
              ),
              controller: messageController,
            ),
          ),
          SizedBox(width: 8),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: sendMessage,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: myColor,
                ),
                child: Icon(
                  Icons.send_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
