import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/CommentsManagement.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/Screens/Products.dart';
import 'package:flutter_restaurant_app/Screens/orders.dart';

class Services extends StatefulWidget {
  const Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
        ],
        backgroundColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Text(
            'Services',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 60.0, bottom: 20.0, left: 5.0, right: 5.0),
          child: Column(
            children: [
              Text(
                'Choose where you want to go',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsManagement(),
                      ));
                },
                child: Card(
                  color: Colors.green[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/Comments2.jpg',
                        width: 190,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          'Managing Comments',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Products(),
                      ));
                }, // Products page
                child: Card(
                  color: Colors.green[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/foodPage.jpg',
                        width: 200,
                        height: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          'Your Products',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Orders(),
                      ));
                },
                child: Card(
                  color: Colors.green[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logs.jpg',
                        width: 190,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          'Food logs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
