import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';


import 'LogInPageHelpers.dart';


class LogInPage extends StatelessWidget {

  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Provider.of<LogInPageHelpers>(context, listen: false).logInBody(context),
    );
  }
}
