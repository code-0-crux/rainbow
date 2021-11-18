import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';
class ColourChanger extends StatefulWidget {


  @override
  _ColourChangerState createState() => _ColourChangerState();
}

class _ColourChangerState extends State<ColourChanger> {
  List Colour_array = [Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red];
  List Dot_display = [100.0,200.0,300.0,400.0,500.0,600.0,700.0];
  int Final_colour=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Tap the screen and have fun"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     scale: Dot_display[Final_colour],
        //     image: AssetImage("assets/dot.jpg"),
        //
        //   ),
        //
        // ),

        color: Colour_array[Final_colour],
        child: GestureDetector(
          onTap: (){
            setState(() {
              Final_colour= Random().nextInt(6);
              Text(Final_colour.toString());
            });
          },
        ),
      ),
    );
  }
}
