import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/Components/noteBox.dart';
class NotesGrid extends StatefulWidget {
  const NotesGrid({Key? key}) : super(key: key);

  @override
  _NotesGridState createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('notes').orderBy('createdAt',descending: true).snapshots(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) {
              Map noteData = snapshot.data?.docs[index].data() as Map;
              return NoteBox(titleText: noteData['title'], noteText: noteData['note'],
                boxId: FirebaseFirestore.instance.collection("users")
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .collection('notes').doc(snapshot.data?.docs[index].id),
              );
            },
            itemCount: snapshot.data?.docs.length,
          );
        }
        return Text("No Notes",
        style: TextStyle(
          color: Colors.black
        ),
        );
        }
        );
  }
}
