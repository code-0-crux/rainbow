import 'dart:async';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/Anxiety.dart';
import 'package:rainbow/screens/RainbowTabs/Stress.dart';
class StressSS extends StatefulWidget {


  @override
  _StressSSState createState() => _StressSSState();
}

class _StressSSState extends State<StressSS> {
  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: Stress(), type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  List Images =["assets/nature3.jpg",
    "assets/nature4.jpg",
    "assets/nature5.jpg",];
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

              child: Text("Just enjoy where you are now",style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30
              ),)
          ),
        ));
  }
}
