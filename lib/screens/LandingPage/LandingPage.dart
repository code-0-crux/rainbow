import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/FortuneWheel/ActivateWheel.dart';
import 'package:rainbow/screens/FortuneWheel/SpinWheel.dart';
import 'package:rainbow/screens/LandingPage/LandingPageHelpers.dart';


class LandingPage extends StatelessWidget {

  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Provider.of<LandingPageHelpers>(context, listen: false).signUpBody(context),
    );
  }
}
