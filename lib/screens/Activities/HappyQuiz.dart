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
    "A father sees his son doing cycle stunts on playground",
    "A boy finds his passion for chess at his early 20's. He wonders whether he should pursue it professionally?",
    "A girl starts learning guitar and finds it difficult and eventually starts losing interest. What shall she do?",
    "Which is the greatest achievement in life among these",
  ];

  var optionsList1 = [
    "He shall give him some portion of his food",
    "He shall punish his son so his son gets discipline",
    "His passion is most important. Although he won't reach the highest stage he shall pursue chess",
    "That instrument might not be for her. She shall not be hard on herself and find other instrument.",
    "Wealth, Health and Good Relationships",
  ];

  var optionsList2 = [
    "The boy will recommend him for some job at his relatives so he will never feel this again",
    "He shall give his son teachings about consequences of his actions",
    "His passion can be driven into hobbies. No one ever reaches top level at such old age",
    "With practise she might learn it with time. Interest will build over time",
    "Impact on the World",
  ];

  var optionsList3 = [
    "He shall ask the shopkeeper to donate him some food",
    "He thinks his son is small and finds it difficult to control his emotions and so shall ignores it.",
    "He should find a career revolving around chess although not pursuing it professionally.",
    "She shall open up to her teacher about this.",
    "Exploring various possibilities in Life",
  ];

  var colorList = [
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: Provider.of<HappyQuizHelper>(context, listen: false).getIndex != 5
          ? Provider.of<HappyQuizHelper>(context,listen:false).quizAppBar()
          : Provider.of<HappyQuizHelper>(context, listen:false).resultAppBar(),
      body: Provider.of<HappyQuizHelper>(context, listen: false).getIndex != 5
          ? Provider.of<HappyQuizHelper>(context).quizBody(
          context: context,
          question: questions[
          Provider.of<HappyQuizHelper>(context, listen: false)
              .getIndex],
          questionColor: colorList[
          Provider.of<HappyQuizHelper>(context, listen: false)
              .getIndex],
          option1: optionsList1[
          Provider.of<HappyQuizHelper>(context, listen: false)
              .getIndex],
          option2: optionsList2[
          Provider.of<HappyQuizHelper>(context, listen: false)
              .getIndex],
          option3:
          optionsList3[Provider.of<HappyQuizHelper>(context, listen: false).getIndex])
          : Provider.of<HappyQuizHelper>(context,listen: false).resultBody(context),
    );
  }
}
