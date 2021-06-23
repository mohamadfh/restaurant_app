import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Products'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.backspace_outlined), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          // images with details to be added from assets and be changed...
          // + icon to go to AddProductsPage and then add products to this page...
        ],
      ),
    );
  }
}
