import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Games/GameHelper.dart';
import 'package:rainbow/screens/LandingPage/LandingPage.dart';
import 'package:rainbow/screens/LandingPage/LandingPageHelpers.dart';
import 'package:rainbow/screens/LandingPage/LogInPageHelpers.dart';
import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';
import 'screens/SplashScreen.dart';

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
          ChangeNotifierProvider(create: (_)=>GameHelper()),
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