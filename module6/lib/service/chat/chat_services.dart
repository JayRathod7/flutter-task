import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/model.dart';

class ChatService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return firestore
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final user = doc.data();
              return user;
            }).toList());
  }

  Future<void> sendMessage(String receiverID, String message) async {
    final String? currentUserEmail = auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();
    final String currentUserId = auth.currentUser!.uid;

    Message newMessage = Message(
        senderID: currentUserId,
        senderEmail: currentUserEmail!,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);
    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await firestore
        .collection("Chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();

    String chatRoomID = ids.join('_');

    return firestore
        .collection("Chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
