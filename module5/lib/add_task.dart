import 'package:flutter/material.dart';
import 'package:module5/custom_widget/custom_textfield.dart';
import 'package:module5/custom_widget/functions.dart';
import 'package:module5/database_helper/database_helper.dart';
import 'package:module5/home_page.dart';
import 'package:module5/model/data_model.dart';

@immutable
class AddTask extends StatefulWidget {
  List data = [];
  int index;

  AddTask({super.key, required this.data, required this.index});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _time = TextEditingController();
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  int _priority = 0;
  int index = 0;

  DataModel dataModel = DataModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateData();
  }

  _updateData() {
    print("data gone in update function");
    if (widget.data.isNotEmpty) {
      _name.text = widget.data[widget.index].name;
      _desc.text = widget.data[widget.index].desc;
      _datePickerController.text = widget.data[widget.index].date;
      _time.text = widget.data[widget.index].time;
      _priority = widget.data[widget.index].priority;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black,
        title: Text(
          widget.data.isEmpty ? "Add Tasks" : "Update Tasks",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(controller: _name, hintText: "Enter Task Name"),
              const SizedBox(height: 14),
              CustomTextField(
                controller: _desc,
                hintText: "Enter Description",
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: 5,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                  controller: _datePickerController,
                  hintText: "Click here to select date",
                  keyboardType: TextInputType.datetime,
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context))),
              const SizedBox(height: 14),
              CustomTextField(
                  controller: _time,
                  hintText: "Enter Time",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 14),
              DropdownButtonFormField<int>(
                borderRadius: BorderRadius.circular(14),
                // padding: EdgeInsets.only(left: 10, right: 10),
                value: _priority,
                items: const [
                  DropdownMenuItem(value: 0, child: Text('Low')),
                  DropdownMenuItem(value: 1, child: Text('Average')),
                  DropdownMenuItem(value: 2, child: Text('High')),
                ],
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Priority', border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_name.text.isNotEmpty &&
                      _desc.text.isNotEmpty &&
                      _datePickerController.text.isNotEmpty &&
                      _time.text.isNotEmpty) {
                    insertData();
                  } else {
                    CustomFunctions.customToast(
                        "All Fields are Required", Colors.black);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.data.isNotEmpty ? "Update Data" : "Insert Data",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  insertData() {
    if (widget.data.isNotEmpty) {
      var data = DataModel(
          id: widget.data[widget.index].id,
          name: _name.text,
          desc: _desc.text,
          date: _datePickerController.text,
          priority: _priority,
          time: _time.text);
      dataBaseHelper.updateData(data);
      print("Data Update Success fully ");
    } else {
      var data = DataModel(
          name: _name.text,
          desc: _desc.text,
          date: _datePickerController.text,
          priority: _priority,
          time: _time.text,
          isDone: false);

      print("checkBoolean: ${data.isDone}");
      dataBaseHelper.insertData(data);
      print("Data Inserted Success fully");
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    var date = _datePickerController.text;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.isNotEmpty ? DateTime.parse(date) : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      date = picked.toString().split(' ')[0];
      _datePickerController.text = date;
    }
    setState(() {});
  }
}
