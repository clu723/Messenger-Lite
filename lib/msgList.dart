import 'package:flutter/material.dart';
import 'msg.dart';

// List of messages sent by the user and displayed on screen

class MsgList extends StatefulWidget {
  final List<Msg> listItems;

  // constructs MsgList with list parameter required
  MsgList(this.listItems);

  @override
  State<MsgList> createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> {
  // likemsg func doesnt have setstate so we made this to
  // use setstate for refresh
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // sets the number of items to length of listItems that was passed in
      itemCount: this.widget.listItems.length,
      //
      itemBuilder: (context, index) {
        var msg = this.widget.listItems[index];
        return Row(children: [
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(12), // originally 12
                          child: Text(msg.body,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white)),
                        )),
                  ))),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () => like(msg.likedMsg),
              icon: msg.userLiked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              // condensed if/else statement
              color: msg.userLiked ? Colors.red : Colors.black),
        ]);
      },
    );
  }
}
