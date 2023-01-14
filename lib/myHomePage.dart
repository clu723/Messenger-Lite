import 'package:flutter/material.dart';
import 'msg.dart';
import 'msgList.dart';
import 'textInputWidget.dart';

// Home page of app
// was a stateless widget but changed into stateful in order to do the add
// msgs to page thing
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // construct list of messages
  List<Msg> msgs = [];

  // adds new Msg to msgs when user sends a message
  void newMsg(String text) {
    setState(() {
      msgs.add(new Msg(body: text, author: "Chang"));
    });
  }

  // need to override widget method b/c extends statelesswidget
  @override
  Widget build(BuildContext context) {
    // whenever we set up an app should return scaffold; sets up the basic
    // strucuture of a page and can add more widgets
    // return type is widget, so must return a widget
    return Scaffold(
        // adds a bar on top of screen
        appBar: AppBar(
          title: const Text("Messenger Lite"),
        ),
        // body content of app
        body: Column(
          children: [
            // expanded makes widget take up as much space as it can while still
            // allowing any other widget to show up
            // gives the MsgList widget access to the msgs from MyHomePage
            Expanded(child: MsgList(this.msgs)),
            TextInputWidget(this.newMsg),
          ],
        ));
  }
}
