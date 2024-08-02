import 'package:flutter/material.dart';
import '../custom_widget/custom_button.dart';
import '../custom_widget/custom_navigator.dart';

class ShowDialogBox extends StatefulWidget {
  const ShowDialogBox({super.key});

  @override
  State<ShowDialogBox> createState() => _ShowDialogBoxState();
}

class _ShowDialogBoxState extends State<ShowDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Box"),
      ),
      body: Center(
        child: CustomButton(
          name: "Show Box",
          onTap: () {
            showBox();
          },
        ),
      ),
    );
  }

  showBox() {
    CustomFunctions.customDialog(
        context: context,
        title: Row(
          children: [
            const Text("Simple Alert Dialog Box"),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: SizedBox(
          height: 200,
          width: 400,
          child: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: const [
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "An alert dialog (also known as a basic dialog) informs the user about situations that require acknowledgment. An alert dialog has an optional title and an optional list of actions. The title is displayed above the content and the actions are displayed below the content.",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ));
  }
}
