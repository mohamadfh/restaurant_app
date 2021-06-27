import 'package:flutter/cupertino.dart';

class Comment_item extends ChangeNotifier {
  String _title;
  String _user;
  String _reply;
  double _rate;

  String get title => _title;
  String get user => _user;
  String get reply => _reply;
  double get rate => _rate;

  Comment_item(this._title, this._user, this._rate, this._reply);

  SetReply(String reply) {
    _reply = reply;
  }
}
