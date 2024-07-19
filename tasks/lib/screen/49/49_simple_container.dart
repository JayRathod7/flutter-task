import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  const SimpleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
              width: double.infinity,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 150,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.blue,
                  height: 150,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.blue,
                  height: 150,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.blue,
                  height: 150,
                  width: double.infinity,
                ),
              ],
            ),
            GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: double.infinity,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
