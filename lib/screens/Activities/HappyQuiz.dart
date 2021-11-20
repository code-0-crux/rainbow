import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Activities/HappyQuizHelper.dart';

class HappyQuiz extends StatefulWidget {
  @override
  _HappyQuizState createState() => _HappyQuizState();
}

class _HappyQuizState extends State<HappyQuiz> {
  ConstantColors constantColors = ConstantColors();

  var questions = [
    "A Boy sees a Random Poor Person on Street near a hotel needs food",
    " A father sees his son doing cycle  stunts on playground",

  ];

  var optionsList1 =
    [
      "I will give him some portion of my food",
      "He punishes him so his son gets discipline",

    ];

  var optionsList2 =
  [

      "I will recommend him for a cleaning job so he will never feel this again",
      "He gives his son teachings about consequences of his actions",


    ];

  var optionsList3 = [
    "I will ask the shopkeeper to donate him some food",
    "He thinks his son is small and finds it difficult to control his emotions and so ignores it He thinks his son is small and finds it difficult to control his emotions and so ignores it He thinks his son is small and finds it difficult to control his emotions and so ignores it",

  ];

  var colorList = [
    Colors.purple,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: Provider.of<HappyQuizHelper>(context).quizAppBar(),
      body: Provider.of<HappyQuizHelper>(context).quizBody(
          context: context,
          question: questions[Provider.of<HappyQuizHelper>(context,listen: false).getIndex],
          questionColor: colorList[Provider.of<HappyQuizHelper>(context,listen: false).getIndex],
          option1: optionsList1[Provider.of<HappyQuizHelper>(context,listen: false).getIndex],
          option2: optionsList2[Provider.of<HappyQuizHelper>(context,listen: false).getIndex],
          option3: optionsList3[Provider.of<HappyQuizHelper>(context,listen: false).getIndex]),

    );
  }
}
