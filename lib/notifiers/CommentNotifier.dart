import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_app/models/Comment_item.dart';

class CommentNotifier extends ChangeNotifier {
  List<Comment_item> _commentList = [];

  UnmodifiableListView<Comment_item> get commentList =>
      UnmodifiableListView(_commentList);

  addComment(Comment_item comment) {
    _commentList.add(comment);
    notifyListeners();
  }

  addReply(String reply, index) {
    _commentList[index].SetReply(reply);
    notifyListeners();
  }

  Remove_Comment(index) {
    _commentList
        .removeWhere((_comment) => _comment.title == _commentList[index].title);
    notifyListeners();
  }
}
