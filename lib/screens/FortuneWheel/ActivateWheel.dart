import 'package:flutter/material.dart';
import 'package:rainbow/screens/FortuneWheel/SpinWheel.dart';
class ActivateWheel extends StatefulWidget {


  @override
  _ActivateWheelState createState() => _ActivateWheelState();
}

class _ActivateWheelState extends State<ActivateWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SpinWheel()));
              },
              child: Container(
                height: 40,
                width: 200,
                child: Text("Spin"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
