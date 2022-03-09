import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/Components/editNotesField.dart';
import '../Components/notesDisplayField.dart';

class EditNote extends StatefulWidget {
  late String titleText, noteText;
  late DocumentReference boxId;
  EditNote({required this.titleText,required this.noteText, required this.boxId});

  @override
  _EditNoteState createState() => _EditNoteState(titleText: titleText,noteText: noteText,boxId: boxId);
}


class _EditNoteState extends State<EditNote> {
  late String titleText, noteText;
  late DocumentReference boxId;
  _EditNoteState({required this.titleText,required this.noteText, required this.boxId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            EditNotesField(title: titleText,note: noteText,boxID: boxId),
            Container(
                child: NotesDisplayField()),
          ],
        ),
      ),
    );
  }
}
