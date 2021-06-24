import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/AddProducts.dart';
import 'package:flutter_restaurant_app/models/product_item.dart';

class Products extends StatefulWidget {
  List products;
  Products({Key key, @required this.products}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState(products);
}

class _ProductsState extends State<Products> {
  List products;
  _ProductsState(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Products'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  List list_of_products = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProduct(
                                products: products,
                              )));
                  setState(() {
                    products = list_of_products;
                  });
                })
          ],
        ),
        body: products == null
            ? Center(
                child: Text(
                  'No products! \nAdd some with + icon',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            : ListView(
                children: [
                  InkWell(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/food1.jpg'),
                          Text(products[0].title),
                          Text(products[0].price.toString()),
                        ],
                      ),
                    ),
                  )
                ],
              )

        // images with details to be added from assets and be changed...
        );
  }
}
