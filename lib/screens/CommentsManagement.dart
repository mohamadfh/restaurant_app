import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/Screens/HomePage.dart';
import 'package:flutter_restaurant_app/models/Comment_item.dart';
import 'package:flutter_restaurant_app/models/Comments.dart';
import 'package:flutter_restaurant_app/notifiers/CommentNotifier.dart';
import 'package:provider/provider.dart';

class CommentsManagement extends StatelessWidget {
  const CommentsManagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentNotifier commentNotifier = Provider.of<CommentNotifier>(context);
    /*Comment_item c3 = new Comment_item('Great!', 'Mohammad', 4.3, ' ');
    commentNotifier.addComment(c3);*/
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
        ],
        title: Text(
          'Customer\'s Comments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: commentNotifier.commentList.length == 0
          ? Center(
              child: Text(
                'No Comments yet!',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: commentNotifier.commentList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          InkWell(
                            child: ListTile(
                              title: Text(
                                commentNotifier.commentList[index].user,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    commentNotifier.commentList[index].title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                              trailing: SizedBox(
                                height: 30,
                                width: 60,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      commentNotifier.commentList[index].rate
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                    )),
                              ),
                              leading: SizedBox(
                                width: 60,
                                height: 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.orange,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Comments(
                                                  index: index,
                                                )));
                                  },
                                  child: Text(
                                    'Reply',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Consumer<CommentNotifier>(
                            builder: (_, notifier, __) => Text(
                              (notifier.commentList[index].reply == null ||
                                      notifier.commentList[index].reply == ' ')
                                  ? ' '
                                  : 'Replied : ' +
                                      notifier.commentList[index].reply,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
