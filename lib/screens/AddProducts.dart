import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/models/product_item.dart';

class AddProduct extends StatefulWidget {
  List products;
  AddProduct({Key key, this.products}); //: super(key: key);

  @override
  _AddProductState createState() => _AddProductState(products);
}

class _AddProductState extends State<AddProduct> {
  List products;
  product_item product;
  _AddProductState(this.products);
  //final _formkey = GlobalKey<FormState>();
  List<String> category = ['Traditional', 'Burger', 'Pizza', 'Drink'];
  String dropDownValue;

  TextEditingController input1_controller = new TextEditingController();
  TextEditingController input2_controller = new TextEditingController();
  TextEditingController input3_controller = new TextEditingController();
  TextEditingController input4_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add food to your menu!'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                TextFormField(
                  controller: input1_controller,
                  onChanged: (String text) {
                    setState(() {
                      product.Set_title(input1_controller.text);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Food Name*',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey[300],
                      ))),
                ),
                TextFormField(
                  controller: input2_controller,
                  onChanged: (String text) {
                    setState(() {
                      product.Set_description(input2_controller.text);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Food Description*',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey[300],
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Card(
                      child: Center(
                        child: Text('Food image'),

                        // selecting an image and then changing product.image using
                        // function Set_image(String image)
                      ),
                    ), // here we have image of the food
                  ),
                ),
                TextFormField(
                  controller: input3_controller,
                  onChanged: (String text) {
                    setState(() {
                      product.Set_price(double.parse(input3_controller.text));
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Price*',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey[300],
                      ))),
                ),
                TextFormField(
                  controller: input4_controller,
                  onChanged: (String text) {
                    setState(() {
                      product.Set_category(input4_controller.text);
                      products.add(product);
                      print(product.price);
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Category*',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey[300],
                      ))),
                ),

                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 50),
                          ),
                          child: Text('Complete Adding'),
                          onPressed: () {
                            product.Set_title(input1_controller.text);
                            product.Set_description(input2_controller.text);
                            product.Set_price(
                                double.parse(input3_controller.text));
                            product.Set_category(input4_controller.text);
                            products.add(product);
                          }),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(120, 50),
                            onPrimary: Colors.purple,
                          ),
                          child: Text('Add item'),
                          onPressed: () {
                            Navigator.pop(context, products);
                          })
                    ],
                  ),
                ),

                // here should be a button to finish adding and then add product
                // to product List
              ],
            ),
          ),
        ));
  }
}
