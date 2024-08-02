import 'package:flutter/material.dart';
import 'package:module4/screens/61_screen/main_screen_1.dart';
import 'package:module4/screens/61_screen/first_screen.dart';
import 'package:module4/screens/71_navigation_drawer.dart';
import 'package:module4/screens/72_phone_permission_.dart';
import 'package:module4/screens/73_splash_screen.dart';

import 'custom_widget/custom_button.dart';
import 'custom_widget/custom_navigator.dart';
import 'screens/62_showDialog_box.dart';
import 'screens/63_toast_.dart';
import 'screens/64_select_city.dart';
import 'screens/65_exit_app.dart';
import 'screens/66_select_date.dart';
import 'screens/67_see_profile.dart';
import 'screens/68_display_options.dart';
import 'screens/69_dummy_gmail/69_dummy_gmail.dart';
import 'screens/70_bottom_bar.dart';
import 'screens/74_redirect_user/74_redirect_user.dart';
import 'screens/76_input_two_number/76_input_two_number.dart';
import 'screens/77_call_and_sms.dart';
import 'screens/78_crud_operations/78_curd_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    name: "61 - Screens",
                    onTap: () {
                      // Navigator.pushNamed(context, '/showBox');
                      CustomFunctions.customNavigator(
                          context, const FirstScreen());
                    }),
                CustomButton(
                    name: "62 - Simple AlertBOx",
                    onTap: () {
                      // Navigator.pushNamed(context, '/showBox');
                      CustomFunctions.customNavigator(
                          context, const ShowDialogBox());
                    }),
                CustomButton(
                    name: "63 - Flutter Toast",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const ToastExample());
                    }),
                CustomButton(
                    name: "64 - Select City",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const SelectCity());
                    }),
                CustomButton(
                    name: "65 - Exit App",
                    onTap: () {
                      CustomFunctions.customNavigator(context, const ExitApp());
                    }),
                CustomButton(
                    name: "66 - Select Date",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const SelectDate());
                    }),
                CustomButton(
                    name: "67 - See Profile and Log Out",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const SeeProfile());
                    }),
                CustomButton(
                    name: "68 - Display Options",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const DisplayOptions());
                    }),
                CustomButton(
                    name: "69 - Dummy Gmail",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const DummyGmail());
                    }),
                CustomButton(
                    name: "70 - Bottom Bar",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const BottomBar());
                    }),
                CustomButton(
                    name: "71 - Navigation Drawer",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const NavigationDrawerEx());
                    }),
                CustomButton(
                    name: "72 - Phone Permission",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const PhonePermission());
                    }),
                CustomButton(
                    name: "73 - Splash Screen",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const SplashScreen());
                    }),
                CustomButton(
                    name: "74 - Redirect User",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const RedirectUser());
                    }),
                CustomButton(
                    name: "76 - input Two Number",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const InputNumber());
                    }),
                CustomButton(
                    name: "77 - CALL & SMS",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const CallAndSms());
                    }),
                CustomButton(
                    name: "78 - Curd Operations",
                    onTap: () {
                      CustomFunctions.customNavigator(
                          context, const CurdOperations());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
