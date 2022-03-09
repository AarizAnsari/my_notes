import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes/UI_pages/edit_note_page.dart';

class NoteBox extends StatelessWidget {
 late String titleText, noteText;
 late DocumentReference boxId;
 NoteBox({required this.titleText,required this.noteText, required this.boxId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: FittedBox(
                child: Text(titleText),
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    EditNote(titleText: titleText, noteText: noteText, boxId: boxId)));
                },
                  icon: Icon(Icons.border_color,color: Colors.black,size: 15,))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(noteText),
            ),
          ),
        ),
      ),
    );
  }
}
