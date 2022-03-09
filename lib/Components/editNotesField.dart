import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/UI_pages/home_page.dart';

class EditNotesField extends StatefulWidget {
  String title='';
  String note='';
  late DocumentReference boxID;
  EditNotesField({required this.title,required this.note,required this.boxID});
  @override
  _EditNotesFieldState createState() => _EditNotesFieldState(title: title,note: note,boxID: boxID);
}


class _EditNotesFieldState extends State<EditNotesField> {
  String title='';
  String note='';
  String titleHint='';
  String noteHint='';
  late DocumentReference boxID;
  _EditNotesFieldState({required this.title,required this.note,required this.boxID});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Title:"),
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 317,
                child: TextFormField(
                  initialValue: title,
                  onChanged: (val){
                    setState(() {
                      title=val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: titleHint,
                      hintStyle: TextStyle(
                          color: Colors.red
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Note:"),
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 317,
                child: TextFormField(
                 initialValue: note,
                  onChanged: (val){
                    setState(() {
                      note=val;
                    });
                  },
                  maxLines: 3,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: noteHint,
                      hintStyle: TextStyle(
                          color: Colors.red
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          TextButton.icon(
            onPressed: () async{

              if(title!=''&&note!=''){
                boxID.update({
                  'title': title,
                  'note': note
                });
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
              }
              if(title==''&&note==''){
                setState(() {
                  titleHint='Please enter title!';
                  noteHint='Please enter note!';
                });
              }
              if(title==''&&note!=''){
                setState(() {
                  titleHint='Please enter title!';
                  noteHint='';
                });
              }
              if(title!=''&&note==''){
                setState(() {
                  titleHint='';
                  noteHint='Please enter note!';
                });
              }

            },
            icon: Icon(Icons.add,color: Colors.white),
            label: Text("Edit Note",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
