import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';
import 'package:module4/screens/78_crud_operations/database.dart';

import 'student_data.dart';

class CurdOperations extends StatefulWidget {
  const CurdOperations({super.key});

  @override
  State<CurdOperations> createState() => _CurdOperationsState();
}

class _CurdOperationsState extends State<CurdOperations> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _sid = TextEditingController();

  late MyDataBase dataBase = MyDataBase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBase.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CURD Operations"),
        actions: [
          CustomButton(
              name: "SHOW",
              onTap: () {
                CustomFunctions.customNavigator(context, StudentData());
              })
        ],
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
                    save();
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

  save() {
    String name = _name.text;
    String number = _number.text;
    String email = _email.text;
    String sid = _sid.text;

    dataBase.db.rawInsert(
        "insert into students(name,number,email,sid) values(?,?,?,?)",
        [name, number, email, sid]);
    print(sid);
    print("New Data Inserted");
    CustomFunctions.customToast("Data Success fully Added", Colors.green);

    _name.clear();
    _number.clear();
    _email.clear();
    _sid.clear();
  }
}
