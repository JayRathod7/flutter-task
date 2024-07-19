import 'package:flutter/material.dart';

class TwoTextField extends StatefulWidget {
  const TwoTextField({super.key});

  @override
  State<TwoTextField> createState() => _TwoTextFieldState();
}

class _TwoTextFieldState extends State<TwoTextField> {
  TextEditingController _number1 = TextEditingController();
  TextEditingController _number2 = TextEditingController();
  List list = [];
  bool _isCheck = false;

  // int num1 = 0;
  // int num2 = 0;
  // int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Text Field"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _number1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Number 1 ", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _number2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Number 2 ", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_number1.text.isNotEmpty && _number2.text.isNotEmpty) {
                      GetResult();
                      _isCheck = false;
                    } else {
                      _isCheck = true;
                    }
                    setState(() {});
                  },
                  child: Text("Click")),
              _isCheck
                  ? Text(
                      "Please Enter Latter in Text Box",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text("${list[index]}");
                          },
                          itemCount: list.length),
                    )
            ],
          ),
        ),
      ),
    );
  }

  GetResult() {
    print("Enter");
    int num1 = int.parse(_number1.text);
    int num2 = int.parse(_number2.text);
    double n1 = double.tryParse(_number1.text) ?? 0;
    double n2 = double.tryParse(_number2.text) ?? 0;
    for (int i = num1 + 1; i < num2; i++) {
      list.add(i);
      print(i);
    }
    setState(() {});
  }
}
