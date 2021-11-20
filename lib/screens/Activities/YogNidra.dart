import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rainbow/constants/Constantcolors.dart';
class YogNidra extends StatefulWidget {
  @override
  _YogNidraState createState() => _YogNidraState();
}

class _YogNidraState extends State<YogNidra> with TickerProviderStateMixin{
  ConstantColors constantColors = ConstantColors();
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  int TimeDuration = 180;

  Timer timer;
  Timer timerMin;
  bool isTrackPlaying = false;



  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        title: Text("Yog Nidra - Ultimate Healing"),
        backgroundColor: constantColors.blueGreyColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(

                child: Center(child: TimeDuration==1200?Text("Lie down on a mat and close your eyes and Remember do not sleep 😙",style: TextStyle(color: Colors.pink,fontSize: 45),):Text("Yog Nidra will clear all the negative energies in your mind",style: TextStyle(color: Colors.yellowAccent,fontSize: 45),)),
              ),
            ),
            Row(children: [
              Divider(color: Colors.green,thickness: 4,),
              Divider(color: Colors.yellow,thickness: 4,),
              Divider(color: Colors.red,thickness: 4,),
              ]),
            Container(
                child: CircleAvatar(
                  child: Text("$TimeDuration",style: TextStyle(color: Colors.black,fontSize: 50),),
                  backgroundImage: AssetImage("assets/dial.jpg"),
                  radius: 70,
                )
            ),

            Container(
              child: IconButton(
                  iconSize: 80,
                  color: Colors.blue,
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {

                    isTrackPlaying = !isTrackPlaying;

                    if (isTrackPlaying == true) {
                      startTimer();
                      audioCache.play("flute.m4a");
                      audioCache.loop("flute.m4a");
                    } else if (isTrackPlaying == false) {
                      setState(() {
                        TimeDuration =1200;
                        timer.cancel();
                      });

                      audioPlayer.stop();
                    }
                  }
              ),
            ),


            Container(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/3minToon.jpg"),
              ),

            ),
          ],
        ),
      ),
    );
  }
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeDuration > 0) {
        if (TimeDuration == 30) {
          setState(() {
            TimeDuration -= 1;
          });
        }
        else {
          setState(() {
            TimeDuration -= 1;
          });
        }
      }
      if (TimeDuration == 0) {
        timer.cancel();
      }
    });
  }
}
