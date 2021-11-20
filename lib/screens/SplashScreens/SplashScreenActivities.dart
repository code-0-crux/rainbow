import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';

class SplashScreenActivities extends StatefulWidget {

  Widget screen;
  String quote;
  var Images;
  SplashScreenActivities({this.screen,this.Images, this.quote});

  @override
  _SplashScreenActivitiesState createState() => _SplashScreenActivitiesState();
}

class _SplashScreenActivitiesState extends State<SplashScreenActivities> {

  @override
  void initState(){
    Timer(
        Duration(
          seconds: 3,
        ),
            () => Navigator.pushReplacement(context, PageTransition(child: widget.screen, type: PageTransitionType.leftToRight))
    );
    super.initState();
  }
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45, // Try
        body: Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.Images[Random().nextInt(widget.Images.length-1)]),fit: BoxFit.cover
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
              child: Text(widget.quote,style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
              ),)
          ),
        ));
  }
}
