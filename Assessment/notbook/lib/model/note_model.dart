// // To parse this JSON data, do
// //
// //     final historyModel = historyModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));
//
// String historyModelToJson(HistoryModel data) => json.encode(data.toJson());
//
// class HistoryModel {
//   String? noteBookText;
//   double? fontSize;
//   bool? isBold;
//   bool? isItalic;
//   bool? isUnderLine;
//   Color? textColor;
//   TextAlign? textAlign;
//   String? fontFamily;
//
//   HistoryModel({
//     this.noteBookText,
//     this.fontSize,
//     this.isBold,
//     this.isItalic,
//     this.isUnderLine,
//     this.textColor,
//     this.textAlign,
//     this.fontFamily,
//   });
//
//   factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
//     noteBookText: json["noteBookText"],
//     fontSize: json["fontSize"],
//     isBold: json["_isBold"],
//     isItalic: json["_isItalic"],
//     isUnderLine: json["_isUnderLine"],
//     textColor: json["textColor"],
//     textAlign: json["textAlign"],
//     fontFamily: json["fontStyle"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "noteBookText": noteBookText,
//     "fontSize": fontSize,
//     "_isBold": isBold,
//     "_isItalic": isItalic,
//     "_isUnderLine": isUnderLine,
//     "textColor": textColor,
//     "textAlign": textAlign,
//     "fontStyle": fontFamily,
//   };
// }

class NoteModel {
  int? id;
  String? title;
  String? body;
  int? fontSize;
  bool? bold;
  bool? italic;
  bool? underline;
  int? color;
  String? fontStyle;
  String? noteSaveDate;
  String? img;

  NoteModel(
      {this.id,
      this.title,
      this.body,
      this.fontSize,
      this.bold = false,
      this.italic = false,
      this.underline = false,
      this.color,
      this.fontStyle,
      this.img,
      this.noteSaveDate});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    fontSize = json['fontSize'];
    bold = json['bold'] == 1;
    italic = json['italic'] == 1;
    underline = json['underline'] == 1;
    color = json['color'];
    fontStyle = json['fontStyle'];
    img = json['img'];
    noteSaveDate = json['noteSaveDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['fontSize'] = fontSize;
    data['bold'] = bold! ? 1 : 0;
    data['italic'] = italic! ? 1 : 0;
    data['underline'] = underline! ? 1 : 0;
    data['color'] = color;
    data['fontStyle'] = fontStyle;
    data['img'] = img;
    data['noteSaveDate'] = noteSaveDate;
    return data;
  }
}
