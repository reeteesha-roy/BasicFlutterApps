import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (home: CounterScreen()
    );
  }
}
class CounterScreen extends StatefulWidget{
  @override
  createState() => CounterState();
}
class CounterState extends State{
  int counter = 0;
  void increment(){
    setState(() {
      counter++;
    });
  }
    @override
    Widget build(BuildContext context){
      return Scaffold(
      body:Center(
          child:Column(children:
          [Text('$counter'), FloatingActionButton(onPressed:increment)],
          )
      )
    );
  }
}
