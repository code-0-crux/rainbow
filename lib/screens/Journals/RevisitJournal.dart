import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/services/FirebaseWork.dart';

class RevisitJournal extends StatefulWidget {
  DocumentSnapshot docData;

  RevisitJournal(this.docData);

  @override
  _RevisitJournalState createState() => _RevisitJournalState();
}

class _RevisitJournalState extends State<RevisitJournal> {
  ConstantColors constantColors = ConstantColors();

  TextEditingController journalText = TextEditingController();
  Color textColor;
  String category;
  String instructions;
  List Images = [
    "assets/note.jpg"
  ];
  int imageSelected;


  int imageBackup;
  Color colorBackup;
  String text;

  @override
  void initState() {
    journalText =
        TextEditingController(text: widget.docData.data()['experience']);
    textColor =
        Color(int.parse(widget.docData.data()['fontColor'])).withOpacity(1.0);
    imageSelected = widget.docData.data()['image'];
    category = widget.docData.data()['category'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (category == "Relieving Stress") {
      instructions = "Write about what stresses you";
    }
    else if (category == "Self Awareness") {
      instructions = "Discover yourself";
    }
    else if (category == "Emotion Management") {
      instructions = "With whom or what are you attached emotionally?";
    }
    else if (category == "Anxiety") {
      instructions = "What are you thinking";
    }else if (category == "Confidence") {
      instructions =  "Write what you like in yourself";
    }  else {
      instructions = "WELCOME TO THE JOURNAL SECTION";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantColors.darkColor,
        actions: [
          IconButton(
            color: Colors.yellowAccent,
              onPressed: () {
                widget.docData.reference.update({
                  "experience": journalText.text,
                  "fontColor": textColor.value.toString(),
                  "image": Images[imageSelected],
                }).whenComplete(() => Navigator.pop(context));
              },
              icon: Icon(Icons.save)),
          IconButton(
            color: Colors.redAccent,
              onPressed: () {
                widget.docData.reference.delete();
              },
              icon: Icon(Icons.delete_forever)),
          DropdownButton<Color>(


              dropdownColor: Colors.white10,
              icon: Icon(
                Icons.color_lens,
                color: Colors.blueAccent,
              ),
              items: <Color>[
                Colors.red,
                Colors.blue,
                Colors.white,
                Colors.purple,
                Colors.black,
                Colors.yellow,
                Colors.green,
                Colors.brown,
              ]
                  .map((Color colors) =>
                  DropdownMenuItem(
                    value: Color.fromRGBO(
                        colors.red, colors.green, colors.blue, 1.0),
                    child: Icon(Icons.circle, color: colors),
                  ))
                  .toList(),
              onChanged: (value) {
                text = journalText.text;
                imageBackup = imageSelected;
                setState(() {
                  journalText.text = text;
                  imageSelected = imageBackup;
                  textColor = Color(value.hashCode).withOpacity(1.0);
                });
              }),
          TextButton(onPressed: () {
            showModalBottomSheet(context: context, builder: (content) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: Images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        text = journalText.text;
                        colorBackup = textColor;
                        setState(() {
                          journalText.text = text;
                          textColor = colorBackup;
                          imageSelected = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: Images[index]
                        ),
                      ),
                    );
                  });
            });
          }, child: Text('Image')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images[imageSelected]),
              fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Text(
                  instructions,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: TextField(
                  style: TextStyle(color: textColor),
                  controller: journalText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
