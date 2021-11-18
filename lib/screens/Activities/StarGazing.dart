import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';

class StarGazing extends StatefulWidget {
  @override
  _StarGazingState createState() => _StarGazingState();
}

class _StarGazingState extends State<StarGazing> {
  ConstantColors constantColors = ConstantColors();
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;

  int RandomImage = Random().nextInt(27);
  List TurningImage = <String>[
    "assets/star1.jpg",
    "assets/star4.jpg",
    "assets/star5.jpg",
    "assets/star6.jpg",
    "assets/star8.jpg",
    "assets/star9.jpg",
    "assets/star10.jpg",
    "assets/star11.jpg",
    "assets/star12.jpg",
    "assets/star13.jpg",
    "assets/star14.jpg",
    "assets/star15.jpg",
    "assets/star16.jpg",
    "assets/star19.jpg",
    "assets/star20.jpg",
    "assets/star21.jpg",
    "assets/star22.jpg",
    "assets/star23.jpg",
    "assets/star25.jpg",
    "assets/star26.jpg",
    "assets/star27.jpg",
    "assets/star28.jpg",
    "assets/star29.jpg",
    "assets/star30.jpg",
    "assets/star32.jpg",
    "assets/star33.jpg",
    "assets/star34.jpg",
    "assets/star35.jpg",
  ];

  int Random_Number_Array_Access = Random().nextInt(27);
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
      appBar: AppBar(
        title: Text(
          "Star Gazing",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: constantColors.blueGreyColor,
        actions: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            color: Colors.white,
            onPressed: () {
              isTrackPlaying = !isTrackPlaying;

              if (isTrackPlaying == true) {
                audioCache.play("Cosmos1.m4a");
              } else if (isTrackPlaying == false) {
                audioPlayer.stop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.black,
              height: 630,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(TurningImage[Random_Number_Array_Access]))),
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotSize: 0,

                boxFit: BoxFit.cover,
                images: [
                  Image.asset(
                    "assets/star1.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star4.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star5.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star6.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star8.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star9.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star10.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star11.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star12.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star13.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star14.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star15.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star16.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star19.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star20.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star21.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star22.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star23.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star25.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star26.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star27.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star28.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star29.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star30.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star32.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star33.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star34.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/star35.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
                autoplay: true,
                autoplayDuration: Duration(seconds: 5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
