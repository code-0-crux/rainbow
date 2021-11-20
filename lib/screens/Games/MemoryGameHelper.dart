import 'package:flutter/material.dart';
import 'package:rainbow/screens/Games/MemoryGameNumber.dart';

class MemoryGameHelper with ChangeNotifier {
  confirmText(BuildContext context, Widget screen) {
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to start a new game?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => screen));

            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.green),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No", style: TextStyle(color: Colors.red))),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
