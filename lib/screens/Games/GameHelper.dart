import 'package:flutter/material.dart';
import 'package:rainbow/screens/Games/MemoryGameNumber.dart';

class GameHelper with ChangeNotifier {
  confirmText(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to start a new game?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => MemoryGameNumber()));

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
