import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
class SpinWheel extends StatefulWidget {


  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  int picked = 0;
  int stop = 0;
  String picked_text = "";
  List wheel_tasks = ["Listen to Music","Read a joke","Watch something funny","Walk in Nature","Spending time with pet","Calling an old friend","Talking with your family"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 375,
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
                    stop=1;
                  },
                  items: [
                    FortuneItem(child: Text("Listen to Music",),style: FortuneItemStyle(
                      color: Colors.purple,
                      borderColor: Colors.black,
                      borderWidth: 2.0,
                      textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Read a joke"),style: FortuneItemStyle(
                        color: Colors.indigo,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Watch something funny"),style: FortuneItemStyle(
                        color: Colors.blue,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Walk in Nature"),style: FortuneItemStyle(
                        color: Colors.green,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Spending time with pet"),style: FortuneItemStyle(
                        color: Colors.yellow,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Calling an old friend"),style: FortuneItemStyle(
                        color: Colors.orange,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),
                    FortuneItem(child: Text("Talking with your family"),style: FortuneItemStyle(
                        color: Colors.red,
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                        textStyle: TextStyle(color: Colors.black)
                    )),

                  ],
                ),
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                picked = Random().nextInt(6);
              });
            },
            child: Container(
              color: Colors.pink,
              height: 20,
              width: 100,
              child: Center(child: Text("whoooo")),
            ),
          ),
          Container(
            child: Center(

              child: stop==1?Text(wheel_tasks[picked], style: TextStyle(color: Colors.pink),):Text("ssss",style: TextStyle(color: Colors.pink),)
            ),
          ),

              ],


          ),

      );
  }
}
