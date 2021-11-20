import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Anxiety.dart';
import 'package:rainbow/screens/RainbowTabs/Communication.dart';
class CommunicationSS extends StatefulWidget {

  @override
  _CommunicationSSState createState() => _CommunicationSSState();
}

class _CommunicationSSState extends State<CommunicationSS> {
  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: Communication(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  List Images =["assets/animal4.jpg",
  "assets/animal5.jpg",];
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45, // Try
        body: Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images[Random().nextInt(Images.length-1)]),fit: BoxFit.cover
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.3,0.6,0.9
                  ],

                  colors: [
                    Colors.black, constantColors.blueGreyColor, Colors.pink
                  ]
              )
          ),
          child: Center(

              child: Text("The most important thing in communication is to hear what isn’t being said.",style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30
              ),)
          ),
        ));
  }
}
