import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Comments());
}

class Comments extends StatefulWidget {
  @override
  createState() => new CommentsState();
}

class CommentsState extends State<Comments> {
  List<String> _comments_list = [];
  String message = "";
  final textController = new TextEditingController();
  void _addComments(String str) {
    setState(() {
      _comments_list.add(str);
    });
  }

  Widget _buildCommentsList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments_list.length) {
        return _buildCommentItem(_comments_list[index]);
      }
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    void setMessage(String str) {
      this.message = str;
    }

    return MaterialApp(
        home: Scaffold(
      appBar: new AppBar(
        title: Text('Comments'),
      ),
      body: Column(children: <Widget>[
        Expanded(child: _buildCommentsList()),
        TextField(
          controller: textController,
          onSubmitted: (String submitStr) {
            setMessage(submitStr);
            //_addComments(submitStr);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(30.0),
              hintText: "Write your massage here!",
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.red),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: Colors.purple,
                ),
              ),
              suffixIcon: IconButton(
                  tooltip: "Send message",
                  icon: Icon(
                    Icons.message,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    _addComments(message);
                    textController.clear();
                  })),
        ),
      ]),
    ));
  }
}
