import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My orders'),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.backspace_outlined),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Card(
                  color: Colors.green[100],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/food1.jpg',
                          width: 200,
                          height: 130,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'First order',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
