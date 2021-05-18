import 'package:flutter/material.dart';
class pass_field extends StatefulWidget {
  @override
  _pass_fieldState createState() => _pass_fieldState();
}

class _pass_fieldState extends State<pass_field> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'password',
          hintText: "Enter password",
          icon: Icon(
            Icons.lock,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
        ),
      ),
    );
  }
}
