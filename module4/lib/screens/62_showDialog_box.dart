import 'package:flutter/material.dart';

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
        child: InkWell(
          onTap: () {
            showBox();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.2),
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(20)),
            child: const Text(
              "Show Text",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  showBox() {
    return showDialog(
        barrierDismissible: false,
        // barrierColor: Colors.purple,
        // useSafeArea: false,
        context: context,
        builder: (context) {
          return AlertDialog(
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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "An alert dialog (also known as a basic dialog) informs the user about situations that require acknowledgment. An alert dialog has an optional title and an optional list of actions. The title is displayed above the content and the actions are displayed below the content.",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
