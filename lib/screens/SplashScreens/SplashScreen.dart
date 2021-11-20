import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rainbow/constants/Constantcolors.dart';


class SplashScreen extends StatefulWidget {
  Widget screen;
  SplashScreen(this.screen);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
      gradient: LinearGradient(
      begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.3,0.6,0.9
          ],

          colors: [
            Colors.black, ConstantColors().blueGreyColor, Colors.pink
          ]
      )
    ),
        child: Center(
          child: RichText(
              text: TextSpan(
                  text: 'The ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: constantColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'R',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 34.0
                        ),
                    ),
                    TextSpan(
                      text: 'a',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),
                    TextSpan(
                      text: 'i',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),
                    TextSpan(
                      text: 'n',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),
                    TextSpan(
                      text: 'b',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),
                    TextSpan(
                      text: 'o',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),
                    TextSpan(
                      text: 'w',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0
                      ),
                    ),

                  ]
          ),
        ),
    ),
      ));


  }
}
