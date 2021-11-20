import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
class Meditation extends StatefulWidget {
  @override
  _MeditationState createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> with TickerProviderStateMixin{
  int TimeDuration = 600;
   Timer timer;
  AudioCache audioCache = new AudioCache();
  List Colour_array = [Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red,];
   void startTimer(){

     timer = Timer.periodic(Duration(seconds: 1), (timer) {
       if(TimeDuration>0){
         if(TimeDuration==10){
         setState(() {
           TimeDuration -=1;

         });
       }
         else{
           setState(() {
             TimeDuration -=1;

           });
         }
       }
       if(TimeDuration==0){
         audioCache.load("tune6.wav");
         audioCache.play("tune6.wav");
         timer.cancel();
       }


     });
   }
   // void playStopMusic(){
   //   if (TimeDuration ==0) {
   //     audioCache.load("tune3.mp3");
   //     audioCache.play("8d82b5_Letter_X_Sound_Effect.mp3");
   //   }
   // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meditation-feel it"),
        backgroundColor: Colors.blueGrey,
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
              Text("Relax and close your eyes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),

              Text("$TimeDuration",style: TextStyle(color: Colour_array[Random().nextInt(6)],fontSize: 100,fontWeight: FontWeight.bold),),
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
                  TimeDuration =600;

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
