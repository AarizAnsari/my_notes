import 'package:flutter/material.dart';
import '../cache/notes_grid.dart';

class NotesDisplayField extends StatefulWidget {
  const NotesDisplayField({Key? key}) : super(key: key);

  @override
  _NotesDisplayFieldState createState() => _NotesDisplayFieldState();
}

class _NotesDisplayFieldState extends State<NotesDisplayField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height/2.5,
        child: NotesGrid(),
      ),
    );
  }
}
