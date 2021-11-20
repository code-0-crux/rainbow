import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int TimeDuration1 = 60;
  int TimeDuration2 = 60;
  int TimeDuration3 = 60;

  Timer timer1;
  Timer timer2;
  Timer timer3;
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

                child: Center(child: TimeDuration1==60?Text("Hit the play button and listen carefully",style: TextStyle(color: Colors.pink,fontSize: 45),):Text("You are about feel relaxed and happy",style: TextStyle(color: Colors.yellowAccent,fontSize: 45),)),
              ),
            ),
            Divider(color: Colors.blue,thickness: 4,),
            Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child : Card(
                          color: Colors.purple,
                          child: Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    child: Text("$TimeDuration1",style: TextStyle(color: Colors.black,fontSize: 50),textAlign: TextAlign.center,),
                                    backgroundImage: AssetImage("assets/dial.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Text("Close your eyes and try to hear all the sounds around you",
                                      style: TextStyle(color: Colors.black)),
                                )
                              ]
                          )
                      )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child : Card(
                          color: Colors.yellowAccent,
                          child: Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    child: Text("$TimeDuration2",style: TextStyle(color: Colors.black,fontSize: 50),textAlign: TextAlign.center,),
                                    backgroundImage: AssetImage("assets/dial.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Text("Keep your eyes closed and try to sense all the physical touch you are feeling.",
                                      style: TextStyle(color: Colors.black)),
                                )
                              ]
                          )
                      )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child : Card(
                          color: Colors.green,
                          child: Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    child: Text("$TimeDuration3",style: TextStyle(color: Colors.black,fontSize: 50),textAlign: TextAlign.center,),
                                    backgroundImage: AssetImage("assets/dial.jpg"),
                                    radius: 50,
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Text("Open your eyes and try to see all the colours around you",
                                      style: TextStyle(color: Colors.black)),
                                )
                              ]
                          )
                      )
                  ),
                ]
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
                      //audioCache.play("Cosmos1.m4a");
                    } else if (isTrackPlaying == false) {
                      setState(() {
                        TimeDuration1 = 60;
                        TimeDuration2 = 60;
                        TimeDuration3 = 60;
                        timer1.cancel();
                        timer2.cancel();
                        timer3.cancel();

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
    timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeDuration1 > 0) {

        setState(() {
          TimeDuration1 -= 1;
        });


      }

      if (TimeDuration1 == 0) {
        audioCache.load("tune6.wav");
        audioCache.play("tune6.wav");
        timer.cancel();
        timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (TimeDuration2 > 0) {

            setState(() {
              TimeDuration2 -= 1;
            });


          }
          if (TimeDuration2 == 0) {
            audioCache.load("tune6.wav");
            audioCache.play("tune6.wav");
            timer.cancel();
            timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
              if (TimeDuration3 > 0) {

                setState(() {
                  TimeDuration3 -= 1;
                });


              }
              if (TimeDuration3 == 0) {
                audioCache.load("tune6.wav");
                audioCache.play("tune6.wav");
                timer.cancel();
              }
            }
            );
          }
        }
        );
      }
    }



    );
  }

}



