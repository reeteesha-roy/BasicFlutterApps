import 'package:flutter/material.dart';

void main() {
  runApp(MyClass());
}

class MyClass extends StatefulWidget {
  @override
  MyClassState createState() => MyClassState();
}

class MyClassState extends State<MyClass> {
  Color cardColor = Colors.green;

  void changeColor() {
    setState(() {
      if (cardColor == Colors.cyan) {
        cardColor = Colors.red;
      } else {
        cardColor = Colors.cyan;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Grid View')),
        body: GridView.count(
          crossAxisCount: 3,
          children: [
            InkWell(
              onTap: changeColor,
              child: Card(color: Colors.red),
            ),
            InkWell(
              onTap: changeColor,
              child: Card(color: Colors.green),
            ),
            InkWell(
              onTap: changeColor,
              child: Card(color: Colors.yellow),
            ),
            InkWell(
              onTap: changeColor,
              child: Card(color: Colors.black),
            ),
            InkWell(
              onTap: changeColor,
              child: Card(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
