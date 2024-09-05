import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notbook/widgets/custom_appbar.dart';
import '../db_helper/database_helper.dart';
import '../helper_class/app_color.dart';
import '../helper_class/string.dart';
import '../helper_class/toast_.dart';
import '../model/note_model.dart';
import '../widgets/toolbar_icon_button.dart';
import 'addScreen/add_screen.dart';

class HomePage extends StatefulWidget {
  int index;
  List<NoteModel> dataDetail = [];

  HomePage({super.key, required this.index, required this.dataDetail});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;
  bool isClear = false;
  bool _sliderVisible = false;
  bool selectFonts = false;
  bool removeImageIcon = false;
  final TextEditingController _body = TextEditingController();
  final TextEditingController _title = TextEditingController();
  double fontSize = 18.0;
  NoteModel noteModel = NoteModel();
  int textColorCounter = 0;
  String finalFont = "Roboto";
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  late Future<Uint8List> imageBytes;
  // var openImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateNote();
  }

  changeImageCast() {
    var base64image;
    if (imageFile?.exists() != null) {
      base64image = base64Encode(imageFile!.readAsBytesSync().toList());
    }
    return base64image;
  }

  updateNote() {
    if (widget.dataDetail.isNotEmpty) {
      _title.text = widget.dataDetail[widget.index].title.toString();
      _body.text = widget.dataDetail[widget.index].body.toString();
      fontSize = widget.dataDetail[widget.index].fontSize!.toDouble();
      isBold = widget.dataDetail[widget.index].bold!;
      isItalic = widget.dataDetail[widget.index].italic!;
      isUnderline = widget.dataDetail[widget.index].underline!;
      textColorCounter = widget.dataDetail[widget.index].color!;
      finalFont = widget.dataDetail[widget.index].fontStyle!;
    }
    setState(() {});
  }

  void bold() {
    isBold = !isBold;
    setState(() {});
  }

  void italic() {
    isItalic = !isItalic;
    setState(() {});
  }

  void underLine() {
    isUnderline = !isUnderline;
    setState(() {});
  }

  void showSlider() {
    _sliderVisible = !_sliderVisible;
    selectFonts = false;
    setState(() {});
  }

  void showFontStyle() {
    selectFonts = !selectFonts;
    _sliderVisible = false;
    setState(() {});
  }

  void changeFontColor() {
    if (textColorCounter == AppColor.textColorList.length - 1) {
      textColorCounter = 0;
    } else {
      textColorCounter++;
    }
    setState(() {});
  }

  saveData() {
    if (_title.text.isNotEmpty && _body.text.isNotEmpty) {
      if (widget.dataDetail.isNotEmpty) {
        var data = NoteModel(
          id: widget.dataDetail[widget.index].id,
          title: _title.text,
          body: _body.text,
          fontSize: fontSize.toInt(),
          fontStyle: finalFont,
          color: textColorCounter,
          bold: isBold,
          italic: isItalic,
          underline: isUnderline,
          img: widget.dataDetail[widget.index].img,
          noteSaveDate: widget.dataDetail[widget.index].noteSaveDate,
        );
        dataBaseHelper.updateData(data);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddScreen()));
        // AppToast.showMassage(msg: "Update");
      } else {
        //add data, insert data
        var data = NoteModel(
            title: _title.text,
            body: _body.text,
            fontSize: fontSize.toInt(),
            fontStyle: finalFont,
            color: textColorCounter,
            bold: isBold,
            italic: isItalic,
            underline: isUnderline,
            img: changeImageCast(),
            noteSaveDate: DateTime.now().toString());
        dataBaseHelper.insertData(data);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddScreen()));
      }
    } else {
      if (widget.dataDetail.isNotEmpty) {
        dataBaseHelper.deleteData(widget.dataDetail[widget.index].id!);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddScreen()));
      } else {
        AppToast.showMassage(msg: "Empty note discarded");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddScreen()));
      }
    }
  }

  imgPicker() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBytes = pickedFile.readAsBytes();
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveData();
        return false;
      },
      child: Scaffold(
        appBar: appBar(context: context),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: 60,
          child: Center(child: _buildToolBar()),
        ),
        body: Column(
          children: [
            // const Divider(),
            // _buildToolBar(),
            selectFonts || _sliderVisible ? const Divider() : const SizedBox(),
            _sliderVisible ? _getFontSizeSlider() : const SizedBox(),
            selectFonts ? _fontStyleListWidget() : const SizedBox(),
            selectFonts || _sliderVisible ? const Divider() : const SizedBox(),
            _customTextField(),
          ],
        ),
      ),
    );
  }

  Widget _fontStyleListWidget() {
    return Expanded(
        flex: 0,
        child: SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: AppString.fontStyleList.length,
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      finalFont = AppString.fontStyleList[index];
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 6, right: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppString.fontStyleList[index] == finalFont
                            ? Colors.grey
                            : Colors.transparent,
                      ),
                      child: Text(AppString.fontStyleList[index],
                          style: TextStyle(
                              color: AppString.fontStyleList[index] == finalFont
                                  ? Colors.black
                                  : Colors.black,
                              fontFamily:
                                  AppString.fontStyleList[index].toString())),
                    ),
                  ),
                );
              }),
        ));
  }

  Widget _getFontSizeSlider() {
    return Slider(
        divisions: 40,
        label: "${fontSize.round().toString()}",
        max: 40,
        min: 10,
        activeColor: Colors.orange,
        value: fontSize,
        onChanged: (newVal) {
          fontSize = newVal;
          setState(() {});
        });
  }

  Widget _buildToolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 12),
        customIconButton(
            color: AppColor.white,
            icon: const Icon(Icons.delete),
            onTap: () {
              _body.clear();
              _title.clear();
              setState(() {});
            }),
        const SizedBox(width: 12),
        customIconButton(
            showColor: _sliderVisible,
            icon: const Icon(Icons.text_increase_outlined),
            onTap: showSlider),
        const SizedBox(width: 12),
        customIconButton(
            showColor: isBold,
            icon: const Icon(Icons.format_bold),
            onTap: () {
              bold();
            }),
        const SizedBox(width: 12),
        customIconButton(
            showColor: isItalic,
            icon: const Icon(Icons.format_italic),
            onTap: () {
              italic();
            }),
        const SizedBox(width: 12),
        customIconButton(
            showColor: isUnderline,
            icon: const Icon(Icons.format_underline),
            onTap: () {
              underLine();
            }),
        const SizedBox(width: 12),
        customIconButton(
            color: AppColor.textColorList[textColorCounter],
            icon: Icon(
              Icons.color_lens,
              color: AppColor.textColorList[textColorCounter] == Colors.black
                  ? Colors.white
                  : Colors.black,
            ),
            onTap: changeFontColor),
        const SizedBox(width: 12),
        customIconButton(
            showColor: selectFonts,
            icon: const Icon(Icons.font_download_outlined),
            onTap: showFontStyle),
        const SizedBox(width: 12),
        customIconButton(
            icon: const Icon(Icons.image_outlined), onTap: imgPicker),
        const SizedBox(width: 12)
      ],
    );
  }

  Widget _customTextField() {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageFile == null
                  ? SizedBox()
                  : Stack(
                      children: [
                        InkWell(
                            onDoubleTap: () {
                              setState(() {
                                removeImageIcon = true;
                                print("img File is $imageFile");
                              });
                            },
                            child: widget.dataDetail.isNotEmpty
                                ? Image.memory(widget
                                    .dataDetail[widget.index].img as Uint8List)
                                : Image.file(imageFile!)),
                        removeImageIcon == true
                            ? IconButton(
                                onPressed: () {
                                  clearImage();
                                },
                                icon: Icon(Icons.delete, color: Colors.pink))
                            : SizedBox(),
                      ],
                    ),
              TextField(
                controller: _title,
                // onTapOutside: (PointerDownEvent event) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                // },
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15),
                  border: InputBorder.none,
                  hintText: AppString.title,
                ),
              ),
              TextField(
                controller: _body,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                // textAlign: textAlign,
                // onTapOutside: (PointerDownEvent event) {
                //   FocusManager.instance.primaryFocus?.unfocus();
                // },
                style: TextStyle(
                    color: AppColor.textColorList[textColorCounter],
                    fontWeight: isBold ? FontWeight.w900 : FontWeight.normal,
                    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                    fontSize: fontSize,
                    fontFamily: finalFont,
                    decoration: isUnderline
                        ? TextDecoration.underline
                        : TextDecoration.none),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 20, top: 11, right: 15),
                  border: InputBorder.none,
                  hintText: AppString.hintText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  clearImage() {
    setState(() {
      removeImageIcon = false;
      imageFile = null;
    });
  }
}
