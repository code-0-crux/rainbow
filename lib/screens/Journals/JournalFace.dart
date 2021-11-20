import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Journals/JournalHelper.dart';

class JournalFace extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Provider.of<JournalHelper>(context, listen:false).noteBody(context),
      backgroundColor: constantColors.darkColor,
     floatingActionButton: Provider.of<JournalHelper>(context, listen:false).newNoteButton(context),
    );
  }
}
