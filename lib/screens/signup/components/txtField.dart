import 'package:flutter/material.dart';

class txt_field extends StatelessWidget {
  String label;
  String hint;
  IconData icon;
  txt_field({
    Key key,
    this.hint,
    this.label,
    this.icon
  }) : super(key: key);

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
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            icon: Icon(icon
            ),
        ),
      ),
    );
  }
}
