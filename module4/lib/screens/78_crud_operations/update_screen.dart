import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/screens/78_crud_operations/student_data.dart';
import '../../custom_widget/custom_navigator.dart';
import 'database.dart';

class UpdateScreen extends StatefulWidget {
  final List data;
  final int index;

  const UpdateScreen({super.key, required this.data, required this.index});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _sid = TextEditingController();

  late MyDataBase dataBase = MyDataBase();
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    dataBase.open();
    updateData();
  }

  updateData() {
    _name.text = widget.data[index].name;
    _number.text = widget.data[index].number;
    _email.text = widget.data[index].email;
    _sid.text = widget.data[index].sid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update screen"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Add Student Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _name,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: " Student Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _number,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Mobile Number", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _email,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: "Email Id", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sid,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Student ID", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            CustomButton(
                name: "Add",
                onTap: () {
                  if (_name.text.isNotEmpty &&
                      _sid.text.isNotEmpty &&
                      _email.text.isNotEmpty &&
                      _number.text.isNotEmpty) {
                    update();
                  } else {
                    CustomFunctions.customToast(
                        "All Field Are Required", Colors.red);
                  }
                })
          ],
        ),
      ),
    );
  }

  update() async {
    var result = await dataBase.db.rawUpdate(
        'Update students SET name = ?,number = ?,email =?,sid = ? WHERE  id= ? ',
        [
          _name.text,
          _number.text,
          _email.text,
          _sid.text,
          widget.data[index].id
        ]);

    if (result == result) {
      CustomFunctions.customToast("Data Update Success Fully", Colors.black);
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const StudentData()));
    setState(() {});
  }
}
