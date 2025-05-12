import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  createState() => MyAppState();
}

var namecontroller = TextEditingController();

final _formKey = GlobalKey<FormState>();
String message = '';
String? name;

myvalidator() {
  if (_formKey.currentState!.validate()) {
    // Form is valid
    setState(() {
      message = 'Login Successful';
    });
  } else {
    // Form is invalid
    setState(() {
      message = 'Failed';
    });
  }
  name = namecontroller.text; // Assign name from the controller text
  namecontroller.clear(); // Clear the controller after assigning
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login Form')),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                  controller: namecontroller,
                ),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password'; // Fixed error message
                    } else {
                      return null;
                    }
                  },
                  obscureText: true, // Hide password for security
                ),
              ),
              ElevatedButton(
                onPressed: myvalidator,
                child: Text('Login'),
              ),
              Text(message), // Display the result message
            ],
          ),
        ),
      ),
    );
  }
}
