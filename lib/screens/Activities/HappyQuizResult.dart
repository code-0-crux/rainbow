import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';


class HappyQuizResult extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  int score;

  HappyQuizResult(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor,
        title: Text('Prediction',
          style: TextStyle(color: Colors.purpleAccent,
          fontSize: 18,),),
      ),
      body: Container(

        color: constantColors.darkColor,
        child: Column(
          children: [
            Container(
                child: Text(
                  "After analyzing your decisions, we predict that ",
                  style: TextStyle(
                    color: constantColors.greenColor,
                    fontSize: 16,


                  ),
                )),
            Container(child: personTraits()),
            SizedBox(height: 300,width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/result.jpg"),),
          ],
        ),
      ),
    );
  }

  Widget personTraits() {
    if (score == 0) {
      return Text(
        "You are quite an emotional person, you consider people's priority at the top level",
        style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold, fontSize: 16),
      );
    }
    if (score >= 35) {
      return Text(
          "You are quite a balanced person, most of your decisions are based on realistic solutions.Sometimes your emotions do dominate your decisions, but at the end it brings a positive result for you.",
          style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
    if (score >= 25 && score < 35) {
      return Text(
          "You are quite a practical person, your decisions are usually based on the fact that the solutions to the problems are ought to be in a logical manner. Entangling in emotions is kind off not your way.",
          style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
    if (score <= 15) {
      return Text(
        "You are more inclined towards emotional approach of solutions towards the problems in your way. Sometimes you do take decisions based on facts and current practical scenarios",
        style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold, fontSize: 16),
      );
    }
    if (score >= 15 && score < 25) {
      return Text(
          "You tend to take decisions based on realistic and logic approach to the problems that come your way. You do keep an emotional aspect to your solution,but it generally keeps a lower volume"
          ,style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
  }
}
