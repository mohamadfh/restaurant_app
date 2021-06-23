import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/models/product_item.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formkey = GlobalKey<FormState>();
  List<String> category = ['Traditional', 'Burger', 'Pizza', 'Drink'];
  String dropDownValue;
  List<product_item> products;
  product_item product;
  TextEditingController input_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: input_controller,
              onChanged: (String text) {
                setState(() {
                  product.Set_title(input_controller.text);
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
              controller: input_controller,
              onChanged: (String text) {
                setState(() {
                  product.Set_description(input_controller.text);
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
              controller: input_controller,
              onChanged: (String text) {
                setState(() {
                  product.Set_price(double.parse(input_controller.text));
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
            Container(
              child: Row(
                children: [
                  Text('Category', style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    hint: Text('Select Food\'s Category'),
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String value) {
                      setState(() {
                        dropDownValue = value;
                        product.Set_category(value);
                        products.add(
                            product); // this has to be the last thing to be done
                      });
                    },
                    items:
                        category.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // here should be a button to finish adding and then add product
                  // to product List
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
