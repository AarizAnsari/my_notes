
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void AddNote({required String title,required String note}) async{
  await  FirebaseFirestore.instance.collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes').add({
    'title': title,
    'note': note,
    'createdAt': DateTime.now()
  });
}