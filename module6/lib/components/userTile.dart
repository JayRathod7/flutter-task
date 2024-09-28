import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class userTile extends StatelessWidget {
  userTile({
    super.key,
    required this.text,
    this.onTap,
    required this.id,
  });

  final String text;
  final VoidCallback? onTap;
  final String id;

  TextStyle urbanist = GoogleFonts.urbanist();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 270,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 55,
                        child: Icon(
                          Icons.person_4_outlined,
                          size: 50,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Display name:\n${text.split('@')[0]}",
                        style: GoogleFonts.sora(),
                      ),
                      Divider(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "Email: \n$text",
                          style: GoogleFonts.sora(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.shade50,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade200,
                  child: Icon(
                    Icons.person_4_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text.split('@')[0],
                      style: urbanist.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      text,
                      style: urbanist.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
