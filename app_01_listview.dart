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

  // List of items with colors and titles
  final List<Map<String, dynamic>> items = [
    {'title': 'Item 1', 'color': Colors.red},
    {'title': 'Item 2', 'color': Colors.green},
    {'title': 'Item 3', 'color': Colors.yellow},
    {'title': 'Item 4', 'color': Colors.blue},
    {'title': 'Item 5', 'color': Colors.orange},
    {'title': 'Item 6', 'color': Colors.purple},
    {'title': 'Item 7', 'color': Colors.teal},
    {'title': 'Item 8', 'color': Colors.pink},
  ];

  void changeColor(int index) {
    setState(() {
      if (items[index]['color'] == Colors.cyan) {
        items[index]['color'] = Colors.red;
      } else {
        items[index]['color'] = Colors.cyan;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List View')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: InkWell(
                onTap: () => changeColor(index),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: items[index]['color'],
                    ),
                    title: Text(items[index]['title']),
                    subtitle: Text('Tap to change color'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
