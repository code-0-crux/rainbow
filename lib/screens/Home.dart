import 'package:flutter/material.dart';

import 'RainbowTabs/Communication.dart';
import 'RainbowTabs/Confidence.dart';
import 'RainbowTabs/EmotionManagement.dart';
import 'RainbowTabs/FocusGames.dart';
import 'RainbowTabs/SelfAwareness.dart';
import 'RainbowTabs/Stress.dart';
import 'SplashScreens/AnxietySS.dart';
import 'StartScreenHelper.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  List tabName = [
    "Relieving Stress",
    "Improving Focus",
    "Quitting Anxiety",
    "Boost Confidence",
    "Emotion Management",
    "Self Awareness",
    "Better Communication"
  ];

  List tabs = [
    Stress(),
    FocusGames(),
    AnxietySS(),
    Confidence(),
    EmotionManagement(),
    SelfAwareness(),
    Communication(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<StartScreenHelper>(context, listen: false)
          .startScreenBody(context, tabName, tabs),

    );
  }
}
