import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/screens/Journals/RevisitJournal.dart';
import 'package:rainbow/services/LogInWork.dart';

import 'Journal.dart';

class JournalHelper with ChangeNotifier{


  Widget noteBody(BuildContext context) {
    final ref = Firestore.instance.collection("journals").doc(Provider.of<LogInWork>(context,listen: false).getUserId).collection("myJournals");
    return StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return StaggeredGridView.countBuilder(
            itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            staggeredTileBuilder: (index){
              return StaggeredTile.count(1, index%2==0?2:1);
            },


            itemBuilder: (_, index) {
              return GestureDetector(

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RevisitJournal(
                            snapshot.data.docs[index],
                          )));
                },
                child: Container(


                  color: Colors.yellowAccent,

                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('Journal${index+1}', style: TextStyle(color: Colors.purpleAccent),)

                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  newNoteButton(BuildContext context){
    return FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Journal("Anxiety")));
    },
      child: Icon(Icons.add_circle,color: Colors.yellowAccent,),

      backgroundColor: Colors.black,);
  }
}