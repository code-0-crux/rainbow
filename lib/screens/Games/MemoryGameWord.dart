import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';

import 'MemoryGameHelper.dart';

class MemoryGameWord extends StatefulWidget {
  @override
  _MemoryGameWordState createState() => _MemoryGameWordState();
}

class _MemoryGameWordState extends State<MemoryGameWord> {



  List Colour_array = [Colors.black,Colors.blue];

  TextEditingController answerController = TextEditingController();
  int answerTries = 10;
  double score = 0;

  ConstantColors constantColors = ConstantColors();
  int TimeDuration1 = 10;
  int TimeDuration2 = 200;
  Timer timer;
  Timer timerAnswer;
  bool visibility = false;

  String answer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeDuration1 > 0) {
        setState(() {
          TimeDuration1 -= 1;
        });
      }
      if (TimeDuration1 == 0) {
        timer.cancel();
        setState(() {
          visibility = true;
        });
        startTimerAnswer();
      }
    });
  }

  void startTimerAnswer() {
    timerAnswer = Timer.periodic(Duration(seconds: 1), (timerAnswer) {
      if (TimeDuration2 > 0) {
        setState(() {
          TimeDuration2 -= 1;
        });
      }
      if (TimeDuration2 == 0) {
        timerAnswer.cancel();
        setState(() {
          visibility = false;
        });
      }
    });
  }


  List Words_Array;

  @override
  void initState() {
    startTimer();
    Words_Array = WordMaker();
    super.initState();
  }

  Set answers = {};


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
          appBar: AppBar(
            title: Text("Word"),
            backgroundColor: Colors.brown,
            actions: [
              // IconButton(
              //     onPressed: () {
              //       Provider.of<MemoryGameHelper>(context, listen: false)
              //           .confirmText(context, MemoryGameWord());
              //     },
              //     icon: Icon(Icons.restart_alt)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: constantColors.darkColor,
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.purple,
                                radius: 50.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                       Words_Array[0],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(

                                  Words_Array[0],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.purple,

                                        ),
                                      ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.fromLTRB(72, 2, 72, 2),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.indigo,
                                radius: 60.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                  Words_Array[1],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.indigo,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 60.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[2],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                  Words_Array[2],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                        ),
                                      ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              //padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 60.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[3],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                  Words_Array[3],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                        ),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                                radius: 60.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[4],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                        Words_Array[4],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.yellow,
                                        ),
                                      ),
                              ),
                            ),

                            //Spacer(),
                            Container(
                              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 60.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[5],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                  Words_Array[5],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.orange,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
                                      spreadRadius: 5)
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 50.0,
                                child: TimeDuration1 != 0
                                    ? Text(
                                  Words_Array[6],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,fontWeight: FontWeight.bold
                                        ),
                                      )
                                    : Text(
                                  Words_Array[6],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.brown,
                        thickness: 3,
                      ),

                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: CircleAvatar(
                                child: TimeDuration1 != 0
                                    ? Text(
                                        "$TimeDuration1",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 40),
                                      )
                                    : Text(
                                        "$TimeDuration2",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 40),
                                      ),
                                backgroundImage: AssetImage("assets/dial.jpg"),
                                radius: 50,
                              )),
                              Container(
                                  child: Text(
                                " Score: ${score.toStringAsFixed(2)}%",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 30),
                              )),

                              // IconButton(onPressed: (){
                              //   startTimer();
                              //   //playStopMusic();
                              // }, icon: Icon(Icons.play_arrow),color: Colors.green,
                              //   iconSize: 30,),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.brown,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),

                        ),

                        // child: Row(
                        //   children: [
                        child: Visibility(
                          visible: visibility,
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  if (answerTries > 0) {
                                    if (Words_Array.contains(answer.toLowerCase()) &&
                                        !answers.contains(answer.toLowerCase())) {
                                      setState(() {
                                        answers.add(answer.toLowerCase());
                                        print(
                                            '$answer is present in the list $Words_Array');

                                        print('$Words_Array');
                                        score += 14.28;
                                      });
                                    }
                                    setState(() {
                                      answerTries -= 1;
                                      print(
                                          'You have tried ${10 - answerTries} times');
                                      answerController.clear();
                                    });
                                  } else {
                                    setState(() {
                                      answerController.text =
                                          " Max try limit 10 reached";
                                      null;
                                    });
                                  }

                                  if (answers.length == 7) {
                                    setState(() {
                                      visibility = false;
                                      score = 100;
                                    });
                                  }
                                },
                              ),
                            ),
                            controller: answerController,
                            //keyboardType: TextInputType.number,

                            onChanged: (value) {
                              print('Hey');
                              answer = value;
                            },
                          ),
                        ),
                        //   RaisedButton(onPressed: (){
                        //
                        //       if(Number_Array_Answer.contains(answer)){
                        //         print('$answer is present in the list $Number_Array_Answer');
                        //         Number_Array_Answer.remove(answer);
                        //         print('$Number_Array_Answer');
                        //         answerController.clear();
                        //       }
                        //
                        //
                        //   },
                        //   )
                        //
                        // ],
                        //),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
  }
  List WordMaker(){
    List words = [
      "Start", "Excitement", "Peace", "Love", "Powerful", "Mindful", "Strong", "Motivation", "Encouragement", "Kindness",
      "Empowerment", "Resourceful", "Meditative", "Growth", "Satisfaction","Help", "Achievement", "Gratitude", "Confidence",
      "Clarity", "Happy", "Successful", "Resilient", "Progress", "Accomplishment", "Appreciation", "Energy", "Gain", "Joy",
      "Advantage", "Inspiration", "Anticipation", "Creativity", "Imagination", "Dream", "Productive", "Adaptability",
      "Cooperative", "Fun", "Enjoyment", "Savor", "Sunshine", "Hopeful", "Healthy", "Grateful", "Optimistic", "Spiritual",
      "Exercise", "Relaxation", "Friendliness", "Beauty", "Nature", "Positive", "Enough", "Exhilaration", "Exceptional",
      "Peaceful", "Giving", "Shine", "Contentment", "Advance", "Flourish", "Calm", "Declutter", "Improve", "Adventurous",
      "Lively", "Safe", "Laughter", "Agreement", "Compassion", "Believe", "Freedom", "Understanding", "Excellent",
      "Surpass", "Stable", "Present", "Focused", "Celebrating", "Community", "Sharing", "Conviviality", "Serenity", "Trust",
      "Openness", "Opportunity", "Brighten", "Terrific", "Wellbeing", "Nourishment", "Selfcare", "Transformation", "Cheerful",
      "Fulfilment", "Flow", "Interesting", "Sincere", "Fantastic", "Wise", "Tranquillity", "Vision", "Fabulous", "Absorbing",
      "Vitality", "Courage", "Unique", "Action", "Better", "Smile", "Winwin", "Spunky", "Best", "Sanctuary", "Selfesteem",
      "Value", "Capable", "Happiness", "Commitment", "Consistency", "Patience", "Invigorated", "Benefit", "New", "Imagine",
      "Create", "Empathy", "Active", "Generous", "Share", "Light", "Engagement", "Challenge", "Listen", "Honor", "Pleasure",
      "Truthful", "Enthusiastic","Radiant", "Committed", "Facilitate", "Faithful", "Purpose", "Acceptance", "Learn",
      "Innovative", "Togetherness", "Original", "Energetic", "Growing", "Useful", "Splendid", "Enhance",
      "Plenty", "Quality", "Remarkable", "Caring", "Glad","Skillful","Profit","Flexibility","Competent",
      "Begin", "Persistence", "Thrive", "Invincible", "Brave", "Free", "Good", "Solid", "Heal", "Brilliant", "Integrity",
      "Selfmastery", "Meditate", "Rest", "Concentrate", "Support", "Perspective", "Pleasant", "Connect", "Helpful",
      "Interest", "Curiosity", "Vivacious", "Interact", "Awareness", "Fascinating", "Valuable", "Reassure", "Breathe",
      "Wisdom", "Limitless", "Soul", "Surrender", "Wonder", "Express", "Organized", "Passion", "Humor", "Stillness",
      "Balance", "Genuine", "Ease", "Abundance", "Reward", "Open", "Delight", "Profitable", "Versatile", "Delicious",
      "Worthy", "Centered", "Joyful", "Honest","Affirmation", "Yes","Selfconfidence","Compassionate","Individuality",
      "Choice", "Selfmotivation", "Impressive", "Authentic", "Intuition", "Harmony", "Insightful", "Optimal",
      "Perceptive", "Adept", "Intention", "Worthwhile", "Forgive","Engaging","Incredible", "Faith","Delightful",
      "Richness", "Energized", "Rejoice", "Applaud", "Simplicity", "Effortless", "Move","Tenacious","Empathetic",
      "Inspire", "Boost", "Embolden", "Stunning", "Animated","Supportive", "Nurture", "Invent","Treasure",
      "Solve", "Profound", "Depth", "Healing", "Presence", "Glow", "Ingenuity", "Donate", "Satisfied", "Determined",
      "Spectacular", "Extend", "Thankful" "Assistance", "Uplift", "Elated", "Meaningful", "Thrilled", "Gleam", "Alive",
      "Bliss", "Upbeat", "Efficient", "Loving", "Eager", "Keen", "Guiltfree", "Wonderful", "Ingenious", "Solution",
      "Divine", "Harmonious", "Generous", "Amazing", "Magnificent", "Great","Vibrant", "Affirmative", "Conscious",
      "Refreshing", "Sparkling", "Stupendous", "Well", "Fearless", "Inclusive", "Vitality", "Sustain", "Reinforce",
      "Spirited", "Forward", "Climb", "Empower", "Silence", "Thanks", "Blessing", "Awesome", "Change","Soulful",
      "Expand", "Forge", "Goal", "Liberty", "Friendship", "Extraordinary","Care", "Volunteer", "Discover", "Choose",
      "Stretch", "Rainbow", "Miracle", "Responsibility", "Respect", "Respond", "Welcome", "Comfortable", "Allow",
      "Revitalize", "Strengthen", "Nourish", "Secure", "Give", "Transform", "Openhearted", "Forwardlooking", "Restorative",
      "Thoughtful", "Serendipity", "Amusement", "Relinquish", "Magnanimous", "Spontaneous", "Being","Recover",
    ];
    String word1 = words[Random().nextInt(words.length-1)];
    String word2 = words[Random().nextInt(words.length-1)];
    String word3 = words[Random().nextInt(words.length-1)];
    String word4 = words[Random().nextInt(words.length-1)];
    String word5 = words[Random().nextInt(words.length-1)];
    String word6 = words[Random().nextInt(words.length-1)];
    String word7 = words[Random().nextInt(words.length-1)];

    List Final_Words = [word1.toLowerCase(),word2.toLowerCase(),word3.toLowerCase(),word4.toLowerCase(),word5.toLowerCase(),word6.toLowerCase(),word7.toLowerCase()];

    return Final_Words;
  }
}
