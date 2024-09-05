import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:notbook/db_helper/database_helper.dart';
import 'package:notbook/helper_class/app_color.dart';
import 'package:notbook/model/note_model.dart';
import 'package:notbook/screens/addScreen/add_page_dialog_box.dart';
import 'package:notbook/screens/home_page.dart';
import 'package:notbook/widgets/custom_appbar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<NoteModel> dataList = [];
  NoteModel noteModel = NoteModel();
  bool isContainerSelected = false;
  int selectedIndex = -1;
  List<NoteModel> selectedItem = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var finalData = await dataBaseHelper.showData();
    dataList.clear();
    for (var i in finalData) {
      dataList.add(NoteModel.fromJson(i));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.orange,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(index: 0, dataDetail: [])));
        },
        child: Icon(Icons.add, color: AppColor.black, size: 30),
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return getData();
          },
          child: dataList.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: customWidget())
              : const SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb_outline_sharp,
                          color: Colors.orange, size: 100),
                      SizedBox(height: 10),
                      Text("Note you add appear here"),
                    ],
                  ),
                )),
    );
  }

  Widget customWidget() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (1 / .7)),
      itemBuilder: (context, index) {
        var data = dataList[index];
        Uint8List bytes = base64Decode(data.img.toString());
        return InkWell(
          onDoubleTap: () {
            AddPageDialogBox.showDetailBox(
                data: data, context: context, bytes: bytes);
          },
          onLongPress: () {
            print("Xyz");
            AddPageDialogBox.deleteData(
                onTapConfirm: () {
                  setState(() {
                    dataBaseHelper.deleteData(data.id!);
                    getData();
                    Navigator.pop(context);
                  });
                },
                context: context);
          },
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          dataDetail: dataList,
                          index: index,
                        )));
          },
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            padding:
                const EdgeInsets.only(left: 10, top: 6, right: 10, bottom: 6),
            decoration: BoxDecoration(
                border: selectedItem.contains(data)
                    ? Border.all(color: Colors.blueAccent, width: 3)
                    : Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.img != null
                    ? SizedBox(
                        width: double.infinity,
                        height: data.fontSize! < 24 ? 50 : 82,
                        child: Image.memory(bytes, fit: BoxFit.fill))
                    : SizedBox(),
                Text(
                  data.title.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                data.img != null
                    ? data.fontSize! < 24
                        ? Text(
                            data.body.toString(),
                            maxLines: changeTextViewLine(index),
                            style: TextStyle(
                                color: AppColor.textColorList[data.color!],
                                fontSize: data.fontSize!.toDouble(),
                                height: 1.3,
                                fontFamily: data.fontStyle,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: data.bold!
                                    ? FontWeight.w900
                                    : FontWeight.normal,
                                decoration: data.underline!
                                    ? TextDecoration.underline
                                    : TextDecoration.none),
                          )
                        : SizedBox()
                    : Text(
                        data.body.toString(),
                        maxLines: changeTextViewLine(index),
                        style: TextStyle(
                            color: AppColor.textColorList[data.color!],
                            fontSize: data.fontSize!.toDouble(),
                            height: 1.3,
                            fontFamily: data.fontStyle,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: data.bold!
                                ? FontWeight.w900
                                : FontWeight.normal,
                            decoration: data.underline!
                                ? TextDecoration.underline
                                : TextDecoration.none),
                      )
              ],
            ),
          ),
        );
      },
      itemCount: dataList.length,
    );
  }

  changeTextViewLine(index) {
    var fontSize = dataList[index].fontSize!;
    if (dataList[index].img != null) {
      if (fontSize > 24) {
        return 1;
      } else if (fontSize <= 16) {
        return 2;
      } else if (fontSize < 14) {
        return 3;
      }
    } else {
      if (fontSize < 12) {
        return 6;
      } else if (fontSize < 20) {
        return 4;
      } else if (fontSize < 24) {
        return 3;
      } else if (fontSize < 34) {
        return 2;
      }
      // return 5;
    }
  }
}
