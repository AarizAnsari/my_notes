import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'UI_pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       appBarTheme: AppBarTheme(
         centerTitle: true,
         backgroundColor: Colors.white,
         elevation: 5,
         titleTextStyle: TextStyle(
           color: Colors.black,
           fontSize: 16,
           fontWeight: FontWeight.w400,
         )
       ),
       backgroundColor: Colors.white,
       textButtonTheme: TextButtonThemeData(
         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
       ),
     ),
     home: Home(),
    );
  }
}
