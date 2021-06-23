import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';

class Services extends StatefulWidget {
  const Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Services'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.backspace_outlined), onPressed: () {}),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          // images to be added from assets... //
        ],
      ),
    );
  }
}
