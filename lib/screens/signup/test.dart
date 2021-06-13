import 'package:flutter/material.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/screens/login/test.dart';
class signupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'create new account';
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
  bool validated = false;
  String name;
  String phoneNumber;
  String address;
  String pass;
  String category;
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
                      labelText: 'name',
                      hintText: 'Enter name',
                      icon: Icon(Icons.food_bank)),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState.validate();
                      //disable or enable submit
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'phone number',
                      hintText: 'Enter phone number',
                      icon: Icon(Icons.phone)),
                  validator: (String value) {
                    if (value.trim().length != 11) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState.validate();
                      //disable or enable submit
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'categories',
                      hintText: 'Enter categories',
                      icon: Icon(Icons.food_bank)),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    category = value;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'address',
                      hintText: 'Enter address',
                      icon: Icon(Icons.map)),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value;
                  },
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState.validate();
                      //disable or enable submit
                    });
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
                  validator: (String value) {
                    Pattern p = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$";
                    RegExp regex = new RegExp(p);
                    return (regex.hasMatch(value))
                        ? null
                        : 'Please enter valid password';
                  },
                  onSaved: (value) {
                    pass = value;
                  },
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState.validate();
                      //disable or enable submit
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    OutlineButton(
                      onPressed: _submit,
                      child: const Text('Register'),
                    ),
                    const Spacer()
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    Text("Already have an account?"),
                    TextButton(   onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginPage()),
                      );
                    }, child: Text("login")),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  void _submit() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('Form submitted');

    }
  }
}
