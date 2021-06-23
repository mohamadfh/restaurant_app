import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/screens/login/test.dart';
import 'package:flutter_restaurant_app/screens/signup/test.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';

void main() {
  runApp(MaterialApp(
    title: 'temp navigation root',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('temp nav root'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: Text('login page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginPage()),
              );
            },
          ),
          ElevatedButton(
            child: Text('sign up form'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signupPage()),
              );
            },
          ),
          ElevatedButton(
            child: Text('HomePage'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      )),
    );
  }
}
