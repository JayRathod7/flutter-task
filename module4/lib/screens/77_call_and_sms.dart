import 'package:flutter/material.dart';
import 'package:module4/custom_widget/custom_button.dart';
import 'package:module4/custom_widget/custom_navigator.dart';
import 'package:url_launcher/url_launcher.dart';

class CallAndSms extends StatefulWidget {
  const CallAndSms({super.key});

  @override
  State<CallAndSms> createState() => _CallAndSmsState();
}

class _CallAndSmsState extends State<CallAndSms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Call & SMS"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  name: "CALL",
                  onTap: () {
                    _call();
                  }),
              CustomButton(
                  name: "SMS",
                  onTap: () {
                    _sms();
                  }),
            ],
          ),
        ));
  }

  _call() async {
    var url = Uri.parse("tel:9638910954");
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      CustomFunctions.customToast("Could not launch $url", Colors.transparent);
    }
  }

  _sms() async {
    var url = Uri.parse("sms:9638910954");
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      CustomFunctions.customToast("Could not launch $url", Colors.transparent);
    }
  }
}
