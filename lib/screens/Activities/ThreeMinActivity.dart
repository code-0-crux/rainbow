import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';

class ThreeMinActivity extends StatefulWidget {

  @override
  _ThreeMinActivityState createState() => _ThreeMinActivityState();
}

class _ThreeMinActivityState extends State<ThreeMinActivity> {
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
        title: Text("3 min tasks"),
        backgroundColor: constantColors.blueGreyColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(

                child: Center(child: TimeDuration==180?Text("Hit the play button and listen carefully",style: TextStyle(color: Colors.pink,fontSize: 45),):Text("You are about feel relaxed and happy",style: TextStyle(color: Colors.yellowAccent,fontSize: 45),)),
              ),
            ),
            Divider(color: Colors.green,thickness: 4,),
            Container(
                child: CircleAvatar(
                  child: Text("$TimeDuration",style: TextStyle(color: Colors.black,fontSize: 50),),
                  backgroundImage: AssetImage("assets/dial.jpg"),
                  radius: 50,
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
                      audioCache.play("Cosmos1.m4a");
                    } else if (isTrackPlaying == false) {
                      setState(() {
                        TimeDuration =180;
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


