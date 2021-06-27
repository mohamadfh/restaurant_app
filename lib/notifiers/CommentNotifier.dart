import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_app/models/Comment_item.dart';
import 'package:flutter_restaurant_app/models/Constants.dart';
import 'package:flutter_restaurant_app/models/RestaurantOwner.dart';

class CommentNotifier extends ChangeNotifier {
  List<Comment_item> _commentList = [];
  Constants constants;

  UnmodifiableListView<Comment_item> get commentList =>
      UnmodifiableListView(_commentList);

  void getComments(RestaurantOwner restaurantOwner) async {
    String comments;
    await Socket.connect(constants.ip, constants.port).then((serverSocket) {
      print('connected');
      serverSocket.writeln(restaurantOwner.phoneNumber + "|RestaurantComments");
      serverSocket.flush();
      serverSocket.listen((socket) {
        comments = String.fromCharCodes(socket).trim();
        List<String> eachComment = comments.split("|");
        for (String comment in eachComment) {
          List<String> fields = comment.split(",");
          Comment_item commentItem = new Comment_item(
              fields[0], fields[1], double.parse(fields[2]), ' ');
          commentList.add(commentItem);
        }
      });
      serverSocket.close();
    });
    notifyListeners();
  }

  void SendComments(RestaurantOwner restaurantOwner) async {
    String comments;
    String answer;
    await Socket.connect(constants.ip, constants.port).then((serverSocket) {
      print('connected');
      for (Comment_item c in commentList) {
        comments += c.title + ',' + c.reply + "(";
      }
      serverSocket.writeln(restaurantOwner.phoneNumber + comments);
      serverSocket.flush();
      serverSocket.listen((socket) {
        answer = String.fromCharCodes(socket).trim();
      });
      serverSocket.close();
    });
  }

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
