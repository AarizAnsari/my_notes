import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/Components/noteBox.dart';
import 'package:my_notes/cache/add_note.dart';

class AddNotesField extends StatefulWidget {
  const AddNotesField({Key? key}) : super(key: key);

  @override
  _AddNotesFieldState createState() => _AddNotesFieldState();
}
String title='';
String note='';

TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

class _AddNotesFieldState extends State<AddNotesField> {
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
               controller: titleController,
               onChanged: (val){
                 setState(() {
                   title=val;
                 });
               },
               cursorColor: Colors.black,
               decoration: InputDecoration(
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
                 controller: noteController,
                 onChanged: (val){
                   setState(() {
                     note=val;
                   });
                 },
                 maxLines: 3,
                 cursorColor: Colors.black,
                 decoration: InputDecoration(
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
             AddNote(title: title, note: note);
              setState(() {
             titleController.clear();
             noteController.clear();
              });
             },
             icon: Icon(Icons.add,color: Colors.white),
             label: Text("Add Note",
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
