import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/FirstHomePage.dart';
import 'package:flutter_restaurant_app/Screens/Products.dart';
import 'package:flutter_restaurant_app/Screens/orders.dart';
import 'package:flutter_restaurant_app/Screens/services.dart';
import 'package:flutter_restaurant_app/models/RestaurantOwner.dart';

class HomePage extends StatefulWidget {
  RestaurantOwner restaurantOwner;
  HomePage({this.restaurantOwner});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text('RestaurantApp'),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // Header... //
            new UserAccountsDrawerHeader(
              accountName: Text(
                'User' + widget.restaurantOwner.phoneNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ), // name of restaurant
              accountEmail: Text('Hello@gmail.com'), // g-mail of restaurant
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            // Body... //

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Services()));
              },
              child: ListTile(
                title: Text('Services'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.restaurant_menu, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products()));
              },
              child: ListTile(
                title: Text('Products'),
                leading: Icon(Icons.restaurant_rounded, color: Colors.blue),
              ),
            ),
            Divider(
              height: 40,
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstHomePage()));
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      body: Center(
          child: Expanded(
        child: Text(
          'Welcome ' + 'to your App \n Use Left menu to go forward',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      )),
    );
  }
}
