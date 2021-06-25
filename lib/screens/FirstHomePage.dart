import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/screens/login/test.dart';
import 'package:flutter_restaurant_app/screens/signup/test.dart';

class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to your app',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              'assets/logo.jpg',
              width: 600,
              height: 340,
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              primary: Colors.purple,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginPage()),
              );
            },
          ),
          SizedBox(
            width: 50,
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              primary: Colors.purple,
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signupPage()),
              );
            },
          ),
        ],
      )),
    );
  }
}
