import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module5/add_task.dart';
import 'package:module5/custom_widget/functions.dart';
import 'database_helper/database_helper.dart';
import 'model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  List<DataModel> data = [];
  List<DataModel> foundData = [];
  List emptyData = [];
  int emptyIndex = 0;
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  DataModel dataModel = DataModel();
  Color colors = Colors.black;

  @override
  void initState() {
    super.initState();
    foundData = data;
    getData();
  }

  getData() async {
    var finalDataList = await dataBaseHelper.showData();
    data.clear();
    for (var i in finalDataList) {
      data.add(DataModel.fromJson(i));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding:
                const EdgeInsets.only(top: 2, bottom: 2, left: 14, right: 14),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _searchFilter(value);
                    },
                    controller: search,
                    // showCursor: false,
                    onTapOutside: (PointerDownEvent event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: const InputDecoration(
                        hintText: "Search in main",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white)),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTask(
                          index: emptyIndex,
                          data: emptyData,
                        )));
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: RefreshIndicator(
            onRefresh: () {
              return getData();
            },
            child: data.isEmpty ? emptyBox() : showDataList()));
  }

  emptyBox() {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_box, color: Colors.black26, size: 30),
          SizedBox(height: 10),
          Text(
            "Add Your Tasks",
            style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }

  showDataList() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemCount: foundData.length,
        itemBuilder: (context, index) {
          var task = foundData[index];
          return Container(
            // padding: const EdgeInsets.only(
            //     left: 14, right: 10, top: 4, bottom: 4),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            margin:
                const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
            decoration: BoxDecoration(
                color: foundData[index].isDone == true
                    ? Colors.grey
                    : Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              splashColor: foundData[index].isDone == true
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              onTap: foundData[index].isDone == true
                  ? () {}
                  : () {
                      doneOrNot(index);
                    },
              onLongPress: () {
                fullDetailPage(index);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text.rich(
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: foundData[index].isDone == true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                                TextSpan(children: [
                                  const TextSpan(
                                      text: "Name : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  TextSpan(
                                      text: foundData[index].name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ])),
                            RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyle(
                                  decoration: foundData[index].isDone == true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: "Dec : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  TextSpan(
                                      text: foundData[index].desc,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                          splashColor: foundData[index].isDone == true
                              ? Colors.transparent
                              : Colors.black38,
                          onPressed: foundData[index].isDone == true
                              ? () {}
                              : () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddTask(
                                              data: data, index: index)));
                                },
                          icon: const Icon(Icons.edit, color: Colors.black)),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {
                            var id = data[index].id;
                            deleteConfirmBox(id);
                          },
                          icon: const Icon(Icons.delete, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Date : ${foundData[index].date}",
                        style: TextStyle(
                            decoration: foundData[index].isDone == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 130),
                      Text(
                        "Time : ${foundData[index].time}HR",
                        style: TextStyle(
                            decoration: foundData[index].isDone == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: priorityColors(foundData[index].priority),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      selectPriority(foundData[index].priority),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  fullDetailPage(index) {
    CustomFunctions.customDialog(
        context: context,
        title: Row(
          children: [
            Text(
              data[index].name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(data[index].desc.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "Date : ${foundData[index].date}",
                    style: TextStyle(
                        decoration: foundData[index].isDone == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    "Time : ${foundData[index].time}HR",
                    style: TextStyle(
                        decoration: foundData[index].isDone == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  priorityColors(number) {
    switch (number) {
      case 0:
        // return Colors.green.withOpacity(0.4);
        return Colors.green;
      case 1:
        return Colors.blue;
      // return Colors.blue.withOpacity(0.4);
      case 2:
        // return Colors.red.withOpacity(0.4);
        return Colors.red;
    }
    setState(() {});
  }

  selectPriority(number) {
    switch (number) {
      case 0:
        return "Low - Priority";
      case 1:
        return "Average - Priority";
      case 2:
        return "High - Priority";
    }
    setState(() {});
  }

  deleteConfirmBox(id) {
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
                deleteData(id);

                Navigator.of(context).pop(false);
              },
              child: const Text("OKAY")),
        ]);
  }

  // Color _getCardColor(String taskDate) {
  //   final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //   return taskDate == currentDate
  //       ? Colors.blue.withOpacity(0.4)
  //       : Colors.red.withOpacity(0.4);
  // }

  deleteData(id) {
    dataBaseHelper.deleteData(id);
    print("Data delete success fully");
    data.clear();
    CustomFunctions.customToast("Removed", Colors.black);
    setState(() {
      getData();
    });
  }

  void doneOrNot(index) {
    CustomFunctions.customDialog(
        context: context,
        title: const Text("Complete the Task"),
        content: const Text("Mark this task completed?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("CANCEL")),
          TextButton(
              onPressed: () {
                setState(() {});
                data[index].isDone = true;

                print("${data[index].id}");
                print("task is done:${data[index].isDone}");
                dataModel.isDone = data[index].isDone;
                dataModel.id = data[index].id;
                dataBaseHelper.updateStatus(dataModel);
                //dataBaseHelper.updateData(dataModel);
                Navigator.of(context).pop();
              },
              child: const Text("conform")),
        ]);
  }

  void _searchFilter(String value) {
    List<DataModel> result = [];
    if (value.isEmpty) {
      result = data;
    } else {
      result = data
          .where(
              (user) => user.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundData = result;
    });
  }
}
