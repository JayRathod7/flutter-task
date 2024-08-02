import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';
import 'package:module4/screens/78_crud_operations/model.dart';
import 'package:module4/screens/78_crud_operations/update_screen.dart';

import 'database.dart';

class StudentData extends StatefulWidget {
  const StudentData({super.key});

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {
  late MyDataBase dataBase = MyDataBase();
  List<DataModel> data = [];
  var dataId;
  bool checkDelete = false;

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    dataBase.open();

    getData();
    print("tops");
  }

  getData() async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      var result = await dataBase.db.rawQuery('SELECT * FROM students');
      for (var i in result) {
        data.add(DataModel.fromJson(i));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Data"),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                onLongPress: () {
                  showContextBox(index);
                  dataId = data[index].id;
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                          style: const TextStyle(color: Colors.black),
                          TextSpan(children: [
                            TextSpan(children: [
                              const TextSpan(
                                  text: "Name : ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: data[index].name,
                                  style: const TextStyle(fontSize: 18))
                            ])
                          ])),
                      Text.rich(
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                          TextSpan(children: [
                            TextSpan(children: [
                              const TextSpan(
                                  text: "Email : ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: data[index].email,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis)),
                            ])
                          ])),
                    ],
                  ),
                ),
              );
            }));
  }

  showContextBox(index) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Context Menu",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                CustomButton(
                    name: "UPDATE",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateScreen(data: data, index: index)));
                    }),
                const SizedBox(height: 2),
                CustomButton(
                    name: "DELETE",
                    onTap: () {
                      deleteConfirmBox();
                    }),
                const SizedBox(height: 2),
                CustomButton(
                    name: "EXIT",
                    onTap: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(height: 10),
              ],
            ),
          );
        });
  }

  deleteConfirmBox() {
    CustomFunctions.customDialog(
        context: context,
        title: const Text("Delete"),
        content: const Text("Are you sure you want delete this data?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("CANCEL")),
          TextButton(
              onPressed: () {
                setState(() {
                  checkDelete = true;
                  clickDelete();
                  if (checkDelete == true) {
                    setState(() {
                      data.clear();
                      getData();
                    });
                    Navigator.pop(context);
                  }
                });
                // SystemNavigator.pop();
              },
              child: const Text("OKAY")),
        ]);
  }

  clickDelete() async {
    await dataBase.db.rawDelete('Delete from students where id = $dataId');
    CustomFunctions.customToast(
        "Data Delete Success Fully", Colors.transparent);
    Navigator.pop(context);
    checkDelete = false;
    setState(() {});
  }
}
