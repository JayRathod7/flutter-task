import 'package:flutter/material.dart';

class TextSizeInOrDe extends StatefulWidget {
  const TextSizeInOrDe({super.key});

  @override
  State<TextSizeInOrDe> createState() => _TextSizeInOrDeState();
}

class _TextSizeInOrDeState extends State<TextSizeInOrDe> {
  var _fontsize = 16.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Font Sized Increase Or decrease"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (_fontsize == 0) {
                      _fontsize = 1;
                    } else {
                      setState(() {
                        _fontsize--;
                      });
                    }
                  },
                  icon: Icon(Icons.remove, size: 40)),
              SizedBox(width: 10),
              Text(
                "HELLO",
                style: TextStyle(fontSize: _fontsize),
              ),
              SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _fontsize++;
                    });
                  },
                  icon: Icon(Icons.add, size: 40))
            ],
          ),
          SizedBox(height: 10),
          Text("Font Size Is : $_fontsize")
        ],
      )),
    );
  }
}
