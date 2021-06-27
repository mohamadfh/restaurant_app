import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/Screens/signup/test.dart';
import 'package:flutter_restaurant_app/models/Constants.dart';
//import 'package:flutter_restaurant_app/models/RestaurantOwner.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final Socket socket;
  const RegisterForm({Key key, @required this.socket}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  String serverMsg;
  Constants constants;
  String phoneNumber;
  String pass;
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: t1,
              decoration: const InputDecoration(
                  labelText: 'phone number',
                  hintText: 'Enter phone number',
                  icon: Icon(Icons.phone)),
              onSaved: (value) {
                phoneNumber = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: t2,
              obscureText: obscurePass,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(
                      obscurePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscurePass = !obscurePass;
                    });
                  },
                ),
                icon: Icon(Icons.lock),
              ),
              onSaved: (value) {
                pass = value;
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                const Spacer(),
                OutlineButton(
                  onPressed: _submit,
                  child: const Text('login'),
                ),
                const Spacer()
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                Text("haven\'t registered yet?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signupPage()),
                      );
                    },
                    child: Text("sign up")),
                Spacer()
              ],
            ),
            /*SizedBox(
              height: 20,
            ),
            Text(
              serverMsg,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            )*/
          ],
        ),
      ),
    ));
  }

  void _submit() /*async*/ {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      /*if (t1.text.isNotEmpty && t2.text.isNotEmpty) {
        await Socket.connect(constants.ip, constants.port).then((serverSocket) {
          print('connected');
          serverSocket.writeln("LoginRes");
          serverSocket.flush();
          serverSocket.writeln(t1.text);
          serverSocket.flush();
          serverSocket.writeln(t2.text);
          serverSocket.flush();
          serverSocket.listen((socket) {
            serverMsg = String.fromCharCodes(socket).trim();
            setState(() {});
          });
        });
      }
      if (serverMsg.contains("ok")) {*/
      print('Form submitted');
      //RestaurantOwner restaurantOwner;
      //restaurantOwner.setPhonePass(t1.text, t2.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
  //}
}
