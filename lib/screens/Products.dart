import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/AddProducts.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/notifiers/FoodNotifier.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProduct()));
              })
        ],
      ),
      body: foodNotifier.productList.length == 0
          ? Center(
              child: Text(
                'No products! \nAdd some with + icon',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: foodNotifier.productList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        child: ListTile(
                          title: Text(foodNotifier.productList[index].title),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                foodNotifier.productList[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Consumer<FoodNotifier>(
                                  builder: (_, notifier, __) => IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () =>
                                            notifier.Remove_Food(index),
                                      )),
                            ],
                          ),
                          leading: Image.asset('assets/food1.jpg'),
                          /*Image.asset(
                                  'assets/${foodNotifier.foodList[index].image}'),*/
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
