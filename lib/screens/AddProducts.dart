import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/Products.dart';
import 'package:flutter_restaurant_app/models/product_item.dart';
import 'package:flutter_restaurant_app/notifiers/FoodNotifier.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String title;
  String imageUrl = 'assets/food1.jpg';
  String description;
  String category;
  double price;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add food to your menu!'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Food Name*',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey[300],
                        ))),
                    initialValue: null,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'title is required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      title = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Food Description*',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey[300],
                        ))),
                    initialValue: null,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      description = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      width: 100,
                      child: Card(
                        child: Center(
                          child: Text('Food image'),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Price*',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey[300],
                        ))),
                    keyboardType: TextInputType.number,
                    initialValue: null,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Price is required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      price = double.parse(value);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Food Category*',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey[300],
                        ))),
                    initialValue: null,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Category is required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      category = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 50),
                            onPrimary: Colors.purple,
                          ),
                          child: Text('Add item'),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) return;
                            _formKey.currentState.save();
                            foodNotifier.addFood(product_item(
                                title, description, imageUrl, category, price));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Products()));
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}
