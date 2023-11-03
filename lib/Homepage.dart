import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'FoodPage.dart'; // Import the FoodPage class
import 'ClothesPage.dart'; // Import the ClothesPage class
import 'MoneyPage.dart'; // Import the MoneyPage class
import 'BooksPage.dart'; // Import the BooksPage class
import 'InternshipPage.dart'; // Import the InternshipPage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> imageUrls = [
    'lib/asset/muskurahat.jpg',
    'lib/asset/Pratham Logo.jpg',
    'lib/asset/1289495.jpg',
    'lib/asset/slideshow1.jpeg',
    'lib/asset/Udaan Logo Butterfly.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 106, 46),
        title: const Text('Philanthropy'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 106, 46),
              ),
              child: Container(
                height: 25,
                width: 25,
                child: const Text(
                  'OPTIONS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Food'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Clothes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClothesPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Money'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoneyPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Books'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Internship'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InternshipPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 5 / 5,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 230, 199, 1),
                      ),
                      child: Image.network(
                        url,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                color: const Color.fromRGBO(69, 69, 69, 1),
                child: const Center(
                  child: Text(
                    'Section 80G of the Indian Income Tax Act allows a tax deduction for contributions to certain relief funds and charitable institutions.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Playfair Display',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
