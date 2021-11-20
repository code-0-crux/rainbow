import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
class YogNidra extends StatefulWidget {
  @override
  _YogNidraState createState() => _YogNidraState();
}

class _YogNidraState extends State<YogNidra> with TickerProviderStateMixin{
  int TimeDuration = 30;
  Timer timer;
  AudioCache audioCache = new AudioCache();
  List Colour_array = [Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,Colors.purple,Colors.indigo,Colors.blue];
  void startTimer(){

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(TimeDuration>0){
        if(TimeDuration==30){
          setState(() {
            TimeDuration -=1;
            audioCache.load("8d82b5_Letter_X_Sound_Effect.mp3");
            audioCache.play("8d82b5_Letter_X_Sound_Effect.mp3");
          });
        }
        else{
          setState(() {
            TimeDuration -=1;

          });
        }
      }
      if(TimeDuration==0){
        audioCache.load("8d82b5_Letter_X_Sound_Effect.mp3");
        audioCache.play("8d82b5_Letter_X_Sound_Effect.mp3");
        timer.cancel();
      }


    });
  }
  void playStopMusic(){
    if (TimeDuration ==0) {
      audioCache.load("8d82b5_Letter_X_Sound_Effect.mp3");
      audioCache.play("8d82b5_Letter_X_Sound_Effect.mp3");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meditation-feel it"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/nature2.jpg"),fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Close your eyes and lie down",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),

              Text("$TimeDuration",style: TextStyle(color: Colour_array[TimeDuration],fontSize: 100,fontWeight: FontWeight.bold),),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    startTimer();
                    //playStopMusic();
                  }, icon: Icon(Icons.play_arrow),color: Colors.green,
                    iconSize: 70,),

                  IconButton(onPressed: (){
                    setState(() {
                      timer.cancel();

                    });
                  }, icon: Icon(Icons.pause),color: Colors.red,iconSize: 70,)
                ],),
              IconButton(onPressed: (){
                setState(() {
                  timer.cancel();
                  TimeDuration =30;

                });
              }, icon: Icon(Icons.restart_alt),
                color: Colors.yellow,iconSize: 70,)
            ],
          ),
        ),
      ),

    );
  }
}
