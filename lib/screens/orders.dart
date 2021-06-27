import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/models/Order_item.dart';
import 'package:flutter_restaurant_app/models/RestaurantOwner.dart';
import 'package:flutter_restaurant_app/notifiers/OrdersNotifier.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  RestaurantOwner restaurantOwner;
  Orders({this.restaurantOwner});

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    OrdersNotifier ordersNotifier = Provider.of<OrdersNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            IconButton(
                icon: Icon(Icons.get_app),
                onPressed: () {
                  ordersNotifier.getList(widget.restaurantOwner);
                })
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 86.0),
            child: Text(
              'Orders',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: (ordersNotifier.orderList.length == 0 ||
                ordersNotifier.orderList == null)
            ? Center(
                child: Text(
                  'No Orders!\nCheck with download icon',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            : Container(
                child: ListView.builder(
                    itemCount: ordersNotifier.orderList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.green[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/food1.jpg'),
                            Text(ordersNotifier.orderList[index].price
                                .toString()),
                            Text(ordersNotifier.orderList[index].date),
                            Text(ordersNotifier.orderList[index].address),
                            Text(ordersNotifier.orderList[index].foods),
                            Text(
                              ordersNotifier.orderList[index].user,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ));
  }
}
