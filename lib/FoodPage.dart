import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FoodPage(),
  ));
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  FirebaseService firebaseService = FirebaseService();
  List<Map<String, dynamic>> foodItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<Map<String, dynamic>>? data = await firebaseService.getFoodItems();
    if (data != null) {
      setState(() {
        foodItems = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Page'),
        backgroundColor: Color.fromARGB(255, 248, 106, 46),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'There are several NGOs in India that accept food donations to help those in need. Donating food to these organizations can make a significant impact on the lives of the less fortunate. Here are some well-known NGOs and organizations that accept food donations:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  String itemName = foodItems[index]['Name'];
                  String itemInfo = foodItems[index]['Info'];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(itemName),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                AlertDialog(
                                  title: Text(itemName),
                                  content: SingleChildScrollView(scrollDirection: Axis.vertical,
                                    child: Container(
                                      width: double.infinity,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.50),
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(itemInfo), // Display the item info
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>?> getFoodItems() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('food').get();
      return snapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
