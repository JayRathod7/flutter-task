import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
        preferredSize: Size.fromHeight(10.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/img.png"),
            Container(
                // color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Iron Man (Tony Stark)",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Stark Industries (New York)",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 6),
                        Text(
                          "4.1",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 36),
                        Text(
                          "Like",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.call, color: Colors.blue, size: 36),
                        Text(
                          "Call",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.sms, color: Colors.blue, size: 36),
                        Text(
                          "Massage",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share, color: Colors.blue, size: 36),
                        Text(
                          "Share",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Text(
                  "Tony Stark then continued to aggressively develop new technologies and innovations, leading Stark Industries to become a major contractor for both corporate and government concerns. While personally overseeing the using of his manufactured munitions and weapons by the U.S. Army in the Middle East ,Tony Stark was nearly killed by an exploding land mine; captured by some revolutionary terrorists, he was saved by scientist Ho Yinsen, a fellow prisoner. Stark then developed a suit of sturdy body armor that not only saved his injured heart, but also enabled him to escape imprisonment. Upon returning to the United States, Tony modified the crude battlesuit, ultimately building what would soon become the recognizable armor of Iron Man",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16, height: 1.3),
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }
}
