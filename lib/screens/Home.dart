import 'package:flutter/material.dart';
import 'package:rainbow/screens/SplashScreens/CommunicationSS.dart';
import 'package:rainbow/screens/SplashScreens/ConfidenceSS.dart';
import 'package:rainbow/screens/SplashScreens/EmotionSS.dart';
import 'package:rainbow/screens/SplashScreens/FocusSS.dart';
import 'package:rainbow/screens/SplashScreens/SelfSS.dart';
import 'package:rainbow/screens/SplashScreens/SplashScreenActivities.dart';
import 'package:rainbow/screens/SplashScreens/StressSS.dart';

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
    StressSS(),
    FocusSS(),
    AnxietySS(),
    ConfidenceSS(),
    EmotionSS(),
    SelfSS(),
    CommunicationSS(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<StartScreenHelper>(context, listen: false)
          .startScreenBody(context, tabName, tabs),

    );
  }
}
