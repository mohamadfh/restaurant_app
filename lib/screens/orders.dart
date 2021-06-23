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
      body: InkWell(
        onTap: () {},
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/food1.jpg'),
            Text('hamburger'),
          ],
        ),
      ),
      backgroundColor: Colors.indigoAccent,
    );
  }
}
