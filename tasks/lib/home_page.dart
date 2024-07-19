import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/Tasks/57_Radio_button_example.dart';
import 'package:tasks/Tasks/50_Reverse_number.dart';
import 'package:tasks/Tasks/53_change_bg.dart';
import 'package:tasks/Tasks/56_img_around_textview.dart';
import 'package:tasks/Tasks/54_text_sized.dart';
import 'package:tasks/custom_widget/custom_button.dart';
import 'package:tasks/screen/59/59_login_form.dart';

import 'Tasks/52_calculator.dart';
import 'Tasks/55_display_text_checkbox.dart';
import 'Tasks/58_seek_bar_Ex.dart';
import 'Tasks/51_two_text_field.dart';
import 'screen/49/49_news_screen.dart';
import 'screen/49/49_simple_container.dart';
import 'screen/60/60_restaurant_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Lists"),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                  widget: SimpleContainer(), name: "49. Container Screen"),
              CustomButton(widget: SecondScreen(), name: "49. Article Screen"),
              CustomButton(widget: ReverseNumber(), name: "50. Reverse_number"),
              CustomButton(widget: TwoTextField(), name: "51. Two Text Field"),
              CustomButton(widget: Calculator(), name: "52. Calculator"),
              CustomButton(
                  widget: ChangeBackground(), name: "53. Change Background"),
              CustomButton(
                  widget: TextSizeInOrDe(),
                  name: "54. Font Size Increase Or decrease"),
              CustomButton(
                  widget: DisplayTextCheckbox(),
                  name: "55. Display Text View Using CheckBox"),
              CustomButton(
                  widget: ImgAroundTextview(),
                  name: "56. Img Around Text View"),
              CustomButton(widget: RadioButtonEx(), name: "57. Radio BUtton"),
              CustomButton(widget: SeekBarEx(), name: "58. Seek bar Controls"),
              CustomButton(
                  widget: LoginPage(), name: "59. Login & Registration"),
              CustomButton(
                  widget: RestaurantScreen(), name: "60. Restaurant Screen"),
            ],
          ),
        ),
      ),
    );
  }
}
