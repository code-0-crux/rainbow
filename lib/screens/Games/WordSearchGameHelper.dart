import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';


class WordSearchGameHelper extends StatefulWidget {


  @override
  _WordSearchGameHelperState createState() => _WordSearchGameHelperState();
}

class _WordSearchGameHelperState extends State<WordSearchGameHelper> {
  int numBoxPerRow = 9;
  double padding = 5;
  double temp_score = 0;
  double score = 0;
  String path = "";
  Size sizeBox = Size.zero;
  // add late
  ValueNotifier<List<List<String>>> listChars;
  // save all answers on generate crossword data
  ValueNotifier<List<CrosswordAnswer>> answerList;
  ValueNotifier<CurrentDragObj> currentDragObj;
  ValueNotifier<List<int>> charsDone;
  int count_answerList = 0;

  List Colour_Choosen_Final;


  @override
  void initState() {
    super.initState();
    Colour_Choosen_Final = generateColour();
    listChars = new ValueNotifier<List<List<String>>>([]);
    answerList = new ValueNotifier<List<CrosswordAnswer>>([]);
    var currentTouch;
    var indexArrayOnTouch;
    currentDragObj = new ValueNotifier<CurrentDragObj>(new CurrentDragObj(indexArrayOnTouch, currentTouch));
    charsDone = new ValueNotifier<List<int>>(<int>[]);
    // generate char array crossword
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    // ok.. need build 2 widget.. 1 box 1 list

    // get size width
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            width: double.maxFinite,
            height: size.width - padding * 2,
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(padding),
            child: drawCrosswordBox(),
          ),
          Container(
            alignment: Alignment.center,
            // lets show list word we need solve
            child: drawAnswerList(),
          ),
          Text("Yooo",style: TextStyle(color: Colors.yellow),)
        ],
      ),
    );
  }

  void onDragEnd(PointerUpEvent event) {
    print("PointerUpEvent");
    // check if drag line object got value or not.. if no no need to clear
    if (currentDragObj.value.currentDragLine == null) return;

    currentDragObj.value.currentDragLine.clear();
    currentDragObj.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    // generate ondragLine so we know to highlight path later & clear if condition dont meet .. :D
    generateLineOnDrag(event);


    // get index on drag

    int indexFound = answerList.value.indexWhere((answer) {


      return answer.answerLines.join("-") ==
          currentDragObj.value.currentDragLine.join("-");
    });

    print(currentDragObj.value.currentDragLine.join("-"));
    if (indexFound >= 0) {

      answerList.value[indexFound].done = true;

      // save answerList which complete
      charsDone.value.addAll(answerList.value[indexFound].answerLines);
      charsDone.notifyListeners();
      answerList.notifyListeners();
      onDragEnd()=>null;

    }
    // for (int i =0; i<=5;i++){
    //
    // }

    // if(answerList.length == listChars.length){
    //   score+=10;
    // }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    // get size max per box
    double maxSizeBox =
    ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
      return -1;

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBoxPerRow; i++) {
      xAxisStart = xAxis;
      xAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }

    for (var i = 0; i < numBoxPerRow; i++) {
      yAxisStart = yAxis;
      yAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBoxPerRow + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    // if current drag line is null, dlcare new list for we can save value
    if (currentDragObj.value.currentDragLine == null) {
      currentDragObj.value.currentDragLine = <int>[];
    }

    // we need calculate index array base local position on drag
    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      // check drag line already pass 2 box
      if (currentDragObj.value.currentDragLine.length >= 2) {
        // check drag line is straight line
        var wsOrientation;

        if (currentDragObj.value.currentDragLine[0] % numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] % numBoxPerRow)
          wsOrientation =
              WSOrientation.vertical; // this should vertical.. my mistake.. :)

        else if (currentDragObj.value.currentDragLine[0] ~/ numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
          wsOrientation = WSOrientation.horizontal;

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
            onDragEnd()=>null;
        } else {
          if (wsOrientation == WSOrientation.vertical) {
            if (indexBase % numBoxPerRow !=
                currentDragObj.value.currentDragLine[1] % numBoxPerRow)
              onDragEnd()=>null;
          } else {
            onDragEnd()=>null;
          }
        }
      }

      if (!currentDragObj.value.currentDragLine.contains(indexBase))
        currentDragObj.value.currentDragLine.add(indexBase);
      else if (currentDragObj.value.currentDragLine.length >=
          2) if (currentDragObj.value.currentDragLine[
      currentDragObj.value.currentDragLine.length - 2] ==
          indexBase) onDragEnd()=>null;
    }
    // before mistake , should in here
    currentDragObj.notifyListeners();
  }

  void onDragStart(int indexArray) {
    try {
      List<CrosswordAnswer> indexSelecteds = answerList.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();

      // check indexSelecteds got any match , if 0 no proceed!
      if (indexSelecteds.length == 0) return;
      // nice triggered
      print("Answer found");
      setState(() {
        temp_score+=1;
      });
      currentDragObj.value.indexArrayOnTouch = indexArray;
      currentDragObj.notifyListeners();
    } catch (e) {}
  }

  // nice one

  Widget drawCrosswordBox() {
    // add listener tp catch drag, push down & up
    return Listener(
      onPointerUp: (event) => onDragEnd(event),
      onPointerMove: (event) => onDragUpdate(event),
      child: LayoutBuilder(
        builder: (context, constraints) {
          sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBoxPerRow,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
            itemCount: numBoxPerRow * numBoxPerRow,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              // we need expand because to merge 2d array to become 1..
              // example [["x","x"],["x","x"]] become ["x","x","x","x"]
              String char = listChars.value.expand((e) => e).toList()[index];

              // yeayy.. now we got crossword box.. easy right!!
              // later i will show how to display current word on crossword
              // next show color path on box when drag, we will using Valuelistener
              // done .. yeayy.. this is simple crossword system
              return Listener(
                onPointerDown: (event) => onDragStart(index),
                child: ValueListenableBuilder(
                  valueListenable: currentDragObj,
                  builder: (context, CurrentDragObj value, child) {
                    Color color = Colors.white;

                    if (value.currentDragLine.contains(index))
                      color = Colors
                          .blue; // change color when path line is contain index
                    else if (charsDone.value.contains(index))
                      color = Colour_Choosen_Final[Random().nextInt(6)];
                      //color =Colors.purple;
                      // for(int i=0;i<=6;i++){
                      //
                      //   color = Colour_Choosen_Final[i];
                      //
                      // }



                    // change color box already path correct

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        char.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red),
                      ),
                    );
                  },

                ),

              );
            },
          );
        },
      ),

    );
  }



  void generateRandomWord() {

    var rand= new Random();
    List Shabd= ["Start", "Excite", "Peace", "Love", "Power", "Mind",
      "Strong", "Motive", "Kind", "Help",
     "Happy",  "Energy", "Gain", "Joy", "Dream", "Adapt",
      "Fun", "Enjoy", "Savor",  "Hope", "Health", "Spirit",
       "Relax", "Friend", "Beauty", "Nature",  "Enough",
       "Giving", "Shine",   "Calm",
      "Lively", "Safe", "Laugh", "Agree",
       "Stable", "Focus",  "Share", "Trust",
      "Open",  "Bright",  "Well", "Care", "Cheer",
       "Flow",   "Wise", "Vision", "Absorb",
      "Courage", "Unique", "Action", "Better", "Smile",
      "WinWin", "Spunky", "Best",  "esteem",
      "Value",  "Happy", "New", "Imagine", "Success",
      "Create", "Empathy", "Active",
      "Share", "Light",  "Listen", "Honor",
      "Truth", "Radiant", "Purpose",  "Learn",
       "Energy", "Growing", "Useful",  "Enhance",
      "Plenty", "Quality",  "Glad","Profit",
      "Begin",  "Thrive",  "Brave", "Free", "Good", "Solid", "Heal",
      "Mastery", "Meditate", "Rest", "Support",  "Connect",
      "Wisdom",  "Soul",  "Wonder", "Express",  "Passion", "Humor",
      "Balance", "Genuine", "Ease",  "Reward", "Open", "Delight",
      "Worthy",  "Joyful", "Honest", "Yes",
      "Choice",  "Harmony",  "Optimal",
      "Intent", "Worth", "Forgive", "Faith","Delight",
      "Rejoice", "Applaud", "Simple", "Move","Empathy",
      "Inspire", "Boost", "Support", "Nurture", "Invent",
      "Solve", "Depth", "Heal",  "Glow",  "Donate",
      "Extend", "Assist", "Uplift", "Elated", "Thrill", "Gleam", "Alive",
      "Bliss", "Upbeat", "Loving", "Eager", "Keen",  "Wonder",
      "Divine", "Generous", "Amazing", "Magnify", "Great","Vibrant",
      "Refresh", "Sparkle",  "Well", "Fearless", "Sustain",
      "Forward", "Climb", "Silence", "Thanks", "Awesome", "Change","Soulful",
      "Expand", "Forge", "Goal", "Liberty", "Friend", "Choose",
      "Stretch", "Rainbow", "Miracle", "Respect", "Respond", "Welcome", "Allow",
       "Strength", "Nourish", "Secure", "Give",
      "Thought", "Being","Recover",];
    // if (shabd.length<=5)
    //   {
    //     ApplaShabd = shabd;
    //   }

    var AplaShabd1 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd2 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd3 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd4 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd5 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd6 = Shabd[rand.nextInt(Shabd.length)];
    var AplaShabd7 = Shabd[rand.nextInt(Shabd.length)];
    // this words we want put on crossword game

    final List<String> wl = [AplaShabd1,AplaShabd2,AplaShabd3,AplaShabd4,AplaShabd5,AplaShabd6,AplaShabd7];


    // setup configuration to generate crossword

    // Create the puzzle setting object
    final WSSettings ws = WSSettings(
      width: numBoxPerRow,
      height: numBoxPerRow,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
        //WSOrientation.diagonal,
        //WSOrientation.diagonalUp,
      ]),
    );

    // Create new instance of the WordSearch class
    final WordSearch wordSearch = WordSearch();

    // Create a new puzzle
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    /// Check if there are errors generated while creating the puzzle
    if (newPuzzle.errors.isEmpty) {

      // if no error.. proceed

      //List<List<String>> charsArray = newPuzzle.puzzle;
      listChars.value = newPuzzle.puzzle;
      // done pass..ez

      // Solve puzzle for given word list
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle, wl);
      answerList.value = solved.found.map((solve) => new CrosswordAnswer(solve, numPerRow: numBoxPerRow)).toList();
    }

  }
  generateColour(){
    List Colour_Choosen = [[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red],[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red],[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red],[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red],[Colors.purple,Colors.indigo,Colors.blue,Colors.green,Colors.yellow,Colors.orange,Colors.red],];
    return Colour_Choosen;
  }

  drawAnswerList() {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: answerList,
        builder: (context, List<CrosswordAnswer> value, child) {
          // lets make custom widget using Column & Row

          // how many row child we want show per row?
          int perColTotal = 2;

          // generate using list.generate
          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                // generate child row per row
                // all close on each other.. let make row child distance equally
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  // forgot to declare array for access answerList
                  int indexArray = (index) * perColTotal + indexChild;



                  return Text(

                    // make text more clearly to read
                    (indexArray+1).toString()+" ${value[indexArray].wsLocation.word}",


                    style: TextStyle(
                      fontSize: 18,
                      color:
                      value[indexArray].done ? (Colors.red): Colors.green ,

                      decoration: value[indexArray].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  );

                })).toList(),

              ),
            );
          }).toList();


          return Container(
            child: Column(

              children: list,
            ),

          );

        },
      ),
    );

  }
}

class CurrentDragObj {
  // add late
  Offset currentDragPos;
  Offset currentTouch;
  int indexArrayOnTouch ;
  List<int> currentDragLine = <int>[];

  CurrentDragObj(
      this.indexArrayOnTouch,
      this.currentTouch
      );
}

class CrosswordAnswer {
  bool done = false;
  var indexArray;
  WSLocation wsLocation;
  List<int> answerLines = [];
  // remove @
  CrosswordAnswer(this.wsLocation, {@required int numPerRow}) {
    this.indexArray = this.wsLocation.y * numPerRow + this.wsLocation.x;
    generateAnswerLine(numPerRow);
  }

  // get answer index for each character word
  void generateAnswerLine(int numPerRow) {
    // declare new list<int>
    this.answerLines = <int>[];

    // push all index based base word array
    this.answerLines.addAll(List<int>.generate(this.wsLocation.overlap,
            (index) => generateIndexBaseOnAxis(this.wsLocation, index, numPerRow)));
  }

// calculate index base axis x & y
  generateIndexBaseOnAxis(WSLocation wsLocation, int i, int numPerRow) {
    int x = wsLocation.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack)

      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    else
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;

    return x + y * numPerRow;
  }
}
