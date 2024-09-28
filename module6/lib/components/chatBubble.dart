import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    this.isLastMessage = false,
  });

  final String message;
  final bool isCurrentUser;
  final bool isLastMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCurrentUser ? 16 : 12,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isCurrentUser ? 12 : 0),
              topRight: Radius.circular(isCurrentUser ? 0 : 12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: isCurrentUser ? myColor : Colors.grey.shade500,
          ),
          child: Text(
            message,
            style: GoogleFonts.lexend(
              textStyle: TextStyle(
                color: isCurrentUser ? Colors.white : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        if (isLastMessage) ...[
          const SizedBox(height: 8),
          Container(
            height: 1,
            width: 100,
            color: isCurrentUser ? myColor : Colors.grey.shade500,
          ),
        ],
      ],
    );
  }
}
