import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/AccountHelper.dart';
import 'package:rainbow/screens/Activities/HappyQuizHelper.dart';
import 'package:rainbow/screens/Games/MemoryGameHelper.dart';
import 'package:rainbow/screens/Journals/JournalHelper.dart';
import 'package:rainbow/screens/LandingPage/LandingPage.dart';
import 'package:rainbow/screens/LandingPage/LandingPageHelpers.dart';
import 'package:rainbow/screens/LandingPage/LogInPageHelpers.dart';
import 'package:rainbow/screens/RainbowTabs/GoalHelper.dart';
import 'package:rainbow/screens/RainbowTabs/RainbowTabHelper.dart';
import 'package:rainbow/screens/StartScreenHelper.dart';
import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';
import 'screens/SplashScreens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>FirebaseWork()),
          ChangeNotifierProvider(create: (_)=>LogInPageHelpers()),
          ChangeNotifierProvider(create: (_)=>LogInWork()),
          ChangeNotifierProvider(create: (_)=>LandingPageHelpers()),
          ChangeNotifierProvider(create: (_)=>MemoryGameHelper()),
          ChangeNotifierProvider(create: (_)=>JournalHelper()),
          ChangeNotifierProvider(create: (_)=>HappyQuizHelper()),
          ChangeNotifierProvider(create: (_)=>StartScreenHelper()),
          ChangeNotifierProvider(create: (_)=>GoalHelper()),
          ChangeNotifierProvider(create: (_)=>AccountHelper()),
          ChangeNotifierProvider(create: (_)=>RainbowTabHelper()),
        ],

        child: MyHome()
    );
  }
}

class MyHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: constantColors.blueColor,
        fontFamily: 'Poppins',
        canvasColor: Colors.transparent,
      ),
      home: SplashScreen(LandingPage()),

    );
  }


}