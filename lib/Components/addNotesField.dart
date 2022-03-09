import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/cache/add_note.dart';
import 'package:my_notes/main.dart';

class AddNotesField extends StatefulWidget {
  const AddNotesField({Key? key}) : super(key: key);

  @override
  _AddNotesFieldState createState() => _AddNotesFieldState();
}
String title='';
String note='';
String titleHint='';
String noteHint='';

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
                 controller: noteController,
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
               if (title!=''&&note!=''){AddNote(title: title, note: note);
               titleHint='';
               noteHint='';
               title='';
               note='';
               noteController.clear();
               titleController.clear();
               FocusManager.instance.primaryFocus?.unfocus();
               setState(() {
                 main();
               });
               }
              else if(title==''&&note==''){
                 setState(() {
                   titleHint='Please enter title!';
                   noteHint='Please enter note!';
                 });
               }
              else if(title==''&&note!=''){
                 setState(() {
                   titleHint='Please enter title!';
                   noteHint='';
                 });
               }
              else if(title!=''&&note==''){
                 setState(() {
                   titleHint='';
                   noteHint='Please enter note!';
                 });
               }

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
