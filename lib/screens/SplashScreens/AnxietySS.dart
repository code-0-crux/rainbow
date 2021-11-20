import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Anxiety.dart';
class AnxietySS extends StatefulWidget {

  @override
  _AnxietySSState createState() => _AnxietySSState();
}

class _AnxietySSState extends State<AnxietySS> {

  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: Anxiety(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  List Anxiety_Images =["assets/Anxiety1.jpg","assets/Anxiety2.jpg","assets/Anxiety3.jpg","assets/Anxiety4.jpg","assets/Anxiety5.jpg","assets/Anxiety6.jpg","assets/Anxiety7.jpg","assets/Anxiety8.jpg","assets/Anxiety9.jpg","assets/Anxiety10.jpg",];
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45, // Try
        body: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Anxiety_Images[Random().nextInt(Anxiety_Images.length-1)]),fit: BoxFit.cover
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
            child: Text("Nothing diminishes anxiety faster than action!",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
            ),)
          ),
        ));
  }
}
