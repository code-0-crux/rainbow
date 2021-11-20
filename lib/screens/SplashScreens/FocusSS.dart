import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Anxiety.dart';
import 'package:rainbow/screens/RainbowTabs/FocusGames.dart';
class FocusSS extends StatefulWidget {


  @override
  _FocusSSState createState() => _FocusSSState();
}

class _FocusSSState extends State<FocusSS> {
  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: FocusGames(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  List Images =["assets/nature6.jpg",
  "assets/nature7.jpg",
  "assets/nature8.jpg"];
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

              child: Text("Smart people focus on the right things",style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30
              ),)
          ),
        ));
  }
}
