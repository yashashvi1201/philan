

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodList(),
    );
  }
}

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final firestoreInstance = FirebaseFirestore.instance;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text('Food List'),
      ),
      body: StreamBuilder(
  stream: firestoreInstance.collection('food').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    var foodItems = snapshot.data?.docs;
    return ListView.builder(
      itemCount: foodItems?.length,
      itemBuilder: (context, index) {
        var foodItem = foodItems?[index].data() as Map<String, dynamic>;
        return ListTile(
          title: Text(foodItem['Name']),
          subtitle: Text(foodItem['Info']),
        );
      },
    );
  },
),


      );
  }
}
_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);}
