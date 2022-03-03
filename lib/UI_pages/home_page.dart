import 'package:flutter/material.dart';
import 'package:my_notes/Components/addNotesField.dart';
import 'package:my_notes/Components/notesDisplayField.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add New Note"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AddNotesField(),
            Container(
                child: NotesDisplayField()),
        ],
      ),
      ),
    );
  }
}
