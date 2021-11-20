import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';

import 'MemoryGameHelper.dart';



class MemoryGameNumber extends StatefulWidget {
  @override
  _MemoryGameNumberState createState() => _MemoryGameNumberState();
}

class _MemoryGameNumberState extends State<MemoryGameNumber> {

  List Number_Array = [
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString(),
    Random().nextInt(999).toString()
  ];


  TextEditingController answerController = TextEditingController();

  //List Number_Array_duplicate = List.from(Number_Array);

  int answerTries = 10;
  double score = 0;

  ConstantColors constantColors = ConstantColors();
  int TimeDuration1 = 10;
  int TimeDuration2 = 20;
  Timer timer;
  Timer timerAnswer;
  bool visibility = false;

  String answer;

  List Colour_array = [
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.indigo,
    Colors.blue,

  ];

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeDuration1 > 0) {
        setState(() {
          TimeDuration1 -= 1;
        });
      }
      if (TimeDuration1 == 0) {
        timer.cancel();
        setState((){
          visibility = true;
        });
        startTimerAnswer();

      }
    });

  }
  void startTimerAnswer(){
    timerAnswer = Timer.periodic(Duration(seconds: 1), (timerAnswer){
      if (TimeDuration2 > 0) {
        setState(() {
          TimeDuration2 -= 1;
        });
      }
      if (TimeDuration2 == 0) {
        timerAnswer.cancel();
        setState(() {
          visibility = false;

        });


      }
    });
  }
  @override
  void initState(){
    startTimer();
    super.initState();
  }

  Set answers = {};

  @override
  Widget build(BuildContext context) {

    List Number_Array_Answer = List.from(Number_Array);

    return

    Scaffold(
      appBar: AppBar(
        title: Text("Number"),
        backgroundColor: Colors.brown,
        actions: [
          // IconButton(onPressed: (){
          //   Provider.of<MemoryGameHelper>(context,listen: false).confirmText(context, MemoryGameNumber());
          //
          // }, icon: Icon(Icons.restart_alt)),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              color: constantColors.darkColor,
              child: Column(
                children: [
                     Center(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.purple,
                              radius: 50.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[0],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[0],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.purple,
                                ),
                              ),
                              ),
                            ),


                          Spacer(),
                          Container(

                            padding: EdgeInsets.fromLTRB(72, 2, 72, 2),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo,
                              radius: 60.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[1],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[1],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                     Center(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 60.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[2],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[2],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                          Spacer(),
                          Container(
                            //padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 60.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[3],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[3],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),


                     Center(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.yellow,
                              radius: 60.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[4],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[4],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),

                          //Spacer(),
                          Container(
                            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 60.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[5],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[5],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                     Center(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 50.0,
                              child: TimeDuration1 !=0?Text(
                                Number_Array[6],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                ),
                              ):Text(
                                Number_Array[6],
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     Divider(color: Colors.brown,thickness: 3,),

                     Column(
                       children: [
                         Row(
                           children: [
                             Container(
                               child: CircleAvatar(
                                 child: TimeDuration1!=0?Text("$TimeDuration1",style: TextStyle(color: Colour_array[TimeDuration1],fontSize: 40),):Text("$TimeDuration2",style: TextStyle(color: Colour_array[TimeDuration2],fontSize: 40),),
                                 backgroundImage: AssetImage("assets/dial.jpg"),
                                 radius: 50,
                               )
                             ),
                             Container(
                               child: Text(" Score: ${score.toStringAsFixed(2)}%",style: TextStyle(color: Colors.yellow,fontSize: 30),)
                             ),
                           ],
                         ),
                       ],
                     ),
                     Container(
                      
                      //color: Colors.brown,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        
                        

                      ),
                         child: Visibility(
                           visible: visibility,
                           child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.check,color: Colors.green,),
                                  onPressed: (){
                                    if(answerTries>0){

                                      if(Number_Array_Answer.contains(answer) && !answers.contains(answer)){

                                        setState(() {
                                          answers.add(answer);
                                          print('$answer is present in the list $Number_Array_Answer');
                                          Number_Array_Answer.remove(answer);
                                          print('$Number_Array_Answer');
                                          score+=14.28;
                                        });

                                      }
                                      setState(() {
                                        answerTries -= 1;
                                        print('You have tried ${10-answerTries} times');
                                        answerController.clear();

                                      });

                                    }else{
                                      setState(() {

                                        answerController.text = " Max try limit 10 reached";
                                        null;
                                      });
                                    }

                                    if(answers.length == 7){
                                      setState(() {
                                        visibility = false;
                                        score = 100;
                                      });

                                    }

                                  },
                                ),
                              ),
                              controller: answerController,
                              keyboardType: TextInputType.number,

                              onChanged: (value){
                                print('Hey');
                                answer = value;

                              },

                            ),
                         ),

                    ),
                

                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
