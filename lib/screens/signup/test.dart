import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/login/components/txtField.dart';
import 'package:restaurant_app/screens/login/components/passField.dart';
import 'package:restaurant_app/main.dart';

class signupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white24,
            ),
            Body()
          ],
        )
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            "#signup_page",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Colors.green),
          ),
          SizedBox(height: 100),
          txt_field(
            label: "Restaurant name",
            hint: "Enter Restaurants name",
            icon: Icons.restaurant,
          ),
          SizedBox(height: 30),
          txt_field(
            label: "address",
            hint: "Enter address",
            icon: Icons.map,
          ),
          SizedBox(height: 30),
          txt_field(
            label: "category",
            hint: "Enter food category",
            icon: Icons.restaurant_menu,
          ),
          SizedBox(height: 30),
          txt_field(
            label: "phone number",
            hint: "Enter Phone number",
            icon: Icons.phone,
          ),
          SizedBox(height: 30),
          pass_field(),
          SizedBox(height: 40),
          TextButton(
            onPressed: (){
              return;
            },
            child: Text("sign up",
              style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green),
            ),
          )
        ],
      ),
    );
  }
}


