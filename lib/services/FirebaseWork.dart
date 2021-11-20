import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LogInWork.dart';

class FirebaseWork with ChangeNotifier{

  String initUserEmail;
  String initUserName;
  int initUserGoalCount = 0;
  int initUserJournalGoalCount =0;


  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;
  int get getInitUserGoalCount => initUserGoalCount;

  int get getInitUserJournalCount => initUserJournalGoalCount;


  Future createNewUser(BuildContext context, dynamic data) async{
    return FirebaseFirestore.instance.collection("users").doc(Provider.of<LogInWork>(context, listen:false).getUserId).set(data);
  }

  Future initialiseData(BuildContext context) async{
    return FirebaseFirestore.instance.collection('users').doc(
        Provider.of<LogInWork>(context,listen: false).getUserId).get().then((doc) {
      print("Getting User Data");
      initUserName  = doc.data()['userName'];
      initUserEmail = doc.data()['userEmail'];
      initUserGoalCount = doc.data()['goalCount'];
      initUserJournalGoalCount = doc.data()['journalCount'];
      print(initUserName);
      print(initUserEmail);

      notifyListeners();
    });
  }

  Future Save(BuildContext context, dynamic data) async{
    return FirebaseFirestore.instance.collection('journals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('myJournals').doc().set(data);
  }


  Future goalComplete(BuildContext context, String goal) async{

    notifyListeners();
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('goalsDone').doc().set(
     { 'completedGoals' : goal,

    }
    );
  }

  Future goalIncrement(BuildContext context){
initUserGoalCount += 1;
notifyListeners();
print('Goal Count $initUserGoalCount');
return FirebaseFirestore.instance.collection('users').doc(Provider.of<LogInWork>(context,listen: false).getUserId).update(
  {'goalCount': getInitUserGoalCount,}
);
  }


  Future goalDeleter(BuildContext context, String id){
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context, listen: false).getUserId).collection('myGoals').doc(id).delete();
  }

  Future goalAdder(BuildContext context, dynamic data){
    return FirebaseFirestore.instance.collection('goals').doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection('myGoals').doc().set(data
    );
  }

  Future journalIncrement(BuildContext context){
    initUserJournalGoalCount += 1;
    notifyListeners();
    print('Journal Count $initUserJournalGoalCount');
    return FirebaseFirestore.instance.collection('users').doc(Provider.of<LogInWork>(context,listen: false).getUserId).update(
        {'journalCount': getInitUserJournalCount,}
    );
  }

}