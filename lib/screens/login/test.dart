import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/Screens/signup/test.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'login';
    return MaterialApp(
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
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                Text("havent registered yet?"),
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
          ],
        ),
      ),
    ));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Form submitted');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
