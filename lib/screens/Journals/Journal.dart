import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Journals/JournalFace.dart';
import 'package:rainbow/screens/Journals/RevisitJournal.dart';
import 'package:rainbow/screens/LandingPage/LandingPage.dart';
import 'package:rainbow/screens/SplashScreens/SplashScreen.dart';
import 'package:rainbow/services/FirebaseWork.dart';



class Journal extends StatefulWidget {
  String category;

  Journal(this.category);

  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  ConstantColors constantColors = ConstantColors();
  String instructions;
  TextEditingController textController = TextEditingController();
  Color textColor = Colors.yellow;

  List Images = ["assets/note.jpg","assets/star1.jpg","assets/star6.jpg","assets/star8.jpg","assets/star4.jpg","assets/star5.jpg"];
  int imageSelected=0;

  int imageBackup;
  Color colorBackup;
  String text;


  @override
  Widget build(BuildContext context) {
    if (widget.category == "Relieving Stress") {
      instructions = "Write about what stresses you";
    }
    else if (widget.category == "Self Awareness") {
      instructions = "Discover yourself";
    }
    else if (widget.category == "Emotion Management") {
      instructions = "With whom or what are you attached emotionally?";
    }
    else if (widget.category == "Anxiety") {
      instructions = "What are you thinking";
    }else if (widget.category == "Confidence") {
      instructions =  "Write what you like in yourself";
    }  else {
      instructions = "WELCOME TO THE JOURNAL SECTION";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantColors.darkColor,
        actions: [
          IconButton(onPressed: () {
            Provider.of<FirebaseWork>(context, listen:false).Save(context, {
              "experience": textController.text,
              "fontColor": textColor.value.toString(),
              "category": widget.category,
              "image": imageSelected,
            }).whenComplete(() => Navigator.pop(context));
          }, icon: Icon(Icons.save)),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => JournalFace()));
              },
              icon: Icon(Icons.delete_forever)),
          DropdownButton<Color>(

              dropdownColor: Colors.white10,
              icon: Icon(

                Icons.color_lens,
                color: Colors.yellow,
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
                  .map((Color colors) => DropdownMenuItem(
                value: Color.fromRGBO(
                    colors.red, colors.green, colors.blue, 1.0),
                child: Icon(Icons.circle, color: colors),
              ))
                  .toList(),
              onChanged: (value) {

                text = textController.text;
                imageBackup = imageSelected;
                setState(() {
                  textController.text = text;
                  imageSelected = imageBackup;
                  textColor = Color(value.hashCode).withOpacity(1.0);
                });
              }),
          TextButton(onPressed: () {
            showModalBottomSheet(context: context, builder: (content) {
              return Container(
                color: constantColors.darkColor,
                child: GridView.builder(

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: Images.length!=null?Images.length:0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            text = textController.text;
                            colorBackup = textColor;
                            setState(() {
                              textController.text = text;
                              textColor = colorBackup;
                              imageSelected = index;
                            });

                          },
                          child: Container(

                            decoration: BoxDecoration(


                                image: DecorationImage(
                                    image: AssetImage(Images[index])
                                )
                            ),
                          ),
                        ),
                      );
                    }),
              );
            });
          }, child: Text('Image')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images[imageSelected],
              ),
              fit: BoxFit.cover
            )
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  instructions,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  maxLines: null,
                  style: TextStyle(color: textColor),
                  controller: textController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
