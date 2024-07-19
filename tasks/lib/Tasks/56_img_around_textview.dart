import 'package:flutter/material.dart';

class ImgAroundTextview extends StatefulWidget {
  const ImgAroundTextview({super.key});

  @override
  State<ImgAroundTextview> createState() => _ImgAroundTextviewState();
}

class _ImgAroundTextviewState extends State<ImgAroundTextview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show images '),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_2.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/img_3.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Textview',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.redAccent),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_4.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/img_5.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
