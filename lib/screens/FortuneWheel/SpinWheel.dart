import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rainbow/constants/Constantcolors.dart';
class SpinWheel extends StatefulWidget {


  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  ConstantColors constantColors = ConstantColors();
  int picked = 0;
  int stop = 0;
  String picked_text = "";
  List wheel_tasks = ["Listen to Music","Read a joke","Watch something funny","Walk in Nature","Spending time with pet","Calling an old friend","Talking with your family"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor,
        centerTitle: true,
        title: Text("Tasks Wheeeeeeeel!!",style: TextStyle(color: constantColors.greenColor),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.linearToSrgbGamma(),
            image: AssetImage("assets/sky1.jpg",),fit: BoxFit.cover
          )
        ),
        child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    child: new Container(
    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              child: Card(
                color: constantColors.transperant,
                //color: Colors.blueAccent,
                child: Text("When bored,spin the wheel and do a refreshing activity!",style: TextStyle(color: Colors.yellowAccent,fontSize: 28),),
              ),
            ),

            Container(
              height: 370,
              child: FortuneWheel(
                curve: Curves.decelerate,

                indicators: [

                    FortuneIndicator(

                      alignment: Alignment.topCenter, // <-- changing the position of the indicator
                      child: TriangleIndicator(

                        color: Colors.green, // <-- changing the color of the indicator
                      ),

                    ),

                ],
                    animateFirst: false,
                    selected: picked,
                    onAnimationEnd: (){

                     // Text(picked.toString(),style: TextStyle(color: Colors.pink),);
                      print("$picked");
                      setState(() {
                        stop=1;
                      });
                    },
                    items: [
                      FortuneItem(child: Text("Listen to Music",),style: FortuneItemStyle(
                        color: Colors.purple,
                        borderColor: Colors.transparent,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Read a joke"),style: FortuneItemStyle(
                          color: Colors.indigo,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Watch funny content"),style: FortuneItemStyle(
                          color: Colors.blue,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Walk in Nature"),style: FortuneItemStyle(
                          color: Colors.green,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Time with pet"),style: FortuneItemStyle(
                          color: Colors.yellow,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Call an old friend"),style: FortuneItemStyle(
                          color: Colors.orange,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),
                      FortuneItem(child: Text("Talk with family"),style: FortuneItemStyle(
                          color: Colors.red,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)
                      )),

                    ],
                  ),
            ),

            GestureDetector(
              onTap: (){
                setState(() {
                  stop=0;
                  picked = Random().nextInt(6);
                });
              },
              child: Container(
                //color: constantColors.blueGreyColor,
                color: Colors.blueAccent,
                height: 40,
                width: 100,
                child: Center(child: Text("Whirl it",style: TextStyle(fontSize: 20,color: constantColors.whiteColor),)),
              ),
            ),
            Container(
              child: Center(

                child: stop==1?Text(wheel_tasks[picked], style: TextStyle(color: Colors.purple,fontSize: 25),):Text("Spinning!",style: TextStyle(color: Colors.black,fontSize: 20),)
              ),
            ),

                ],


            ),))
      ),

    );
  }
}
