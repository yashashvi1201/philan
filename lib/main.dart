

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:philan/firebase_options.dart';
import 'package:philan/screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen())

        
  
    ;
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}
class APIs {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
