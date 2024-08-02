import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../custom_widget/custom_navigator.dart';

class PhonePermission extends StatefulWidget {
  const PhonePermission({super.key});

  @override
  State<PhonePermission> createState() => _PhonePermissionState();
}

class _PhonePermissionState extends State<PhonePermission> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    var status = await Permission.phone.request();
    if (status.isDenied) {
      showBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Phone Call Permission"),
    ));
  }

  showBox() {
    CustomFunctions.customDialog(
      context: context,
      title: const Text("Request for permission"),
      content: const Text("Grant Permission for phone call"),
      actions: [
        TextButton(
          child: const Text(
            "Deny",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            "Allow",
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () async {
            await openAppSettings();
          },
        ),
      ],
    );
  }
}
