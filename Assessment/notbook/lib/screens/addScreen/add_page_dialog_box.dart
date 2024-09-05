import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:notbook/model/note_model.dart';

import '../../db_helper/database_helper.dart';
import '../../helper_class/app_color.dart';
import '../../widgets/dialog_box.dart';

class AddPageDialogBox {
  static showDetailBox(
      {required NoteModel data,
      required BuildContext? context,
      required Uint8List? bytes}) {
    CustomDialogBox.customDialog(
        context: context!,
        title: Row(
          children: [
            Expanded(
              child: Text(
                data.title.toString(),
                maxLines: 1,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close_sharp))
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              data.img != null ? Image.memory(bytes!) : SizedBox(),
              Text(
                data.body.toString(),
                style: TextStyle(
                    color: AppColor.textColorList[data.color!],
                    fontSize: data.fontSize!.toDouble(),
                    fontFamily: data.fontStyle,
                    fontWeight:
                        data.bold! ? FontWeight.w900 : FontWeight.normal,
                    decoration: data.underline!
                        ? TextDecoration.underline
                        : TextDecoration.none),
              ),
            ],
          ),
        ));
  }

  static deleteData({
    required VoidCallback onTapConfirm,
    required BuildContext context,
  }) {
    CustomDialogBox.customDialog(
        context: context,
        title: const Text("Delete"),
        content: const Text("Are you sure you want delete this data?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("CANCEL")),
          TextButton(onPressed: onTapConfirm, child: const Text("OKAY")),
        ]);
  }
}
