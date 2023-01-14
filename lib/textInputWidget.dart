import 'package:flutter/material.dart';

// Message input bar; user can type in their message and send it for display

class TextInputWidget extends StatefulWidget {
  // TextInputWidget({super.key});

  // allows textinputwidget access to "text" from myhomepage
  final Function(String) callback;

  // constructor for TextInputWidget, now takes in a function parameter
  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

// responsible for state and rendering of widget
// underscore is convention for state widgets
class _TextInputWidgetState extends State<TextInputWidget> {
  // holder for text
  // String text = '';
  // gathers up user input
  final controller = TextEditingController();

  // disposes widget for refresh
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

// makes text show up according to user's input
// made irrelevant
  // void changeText(text) {
  //   if (text == "clear") {
  //     controller.clear();
  //     // does not work when this.text why?
  //     text = '';
  //   }
  //   // need to wrap within setstate for refreshing
  //   setState(() {
  //     this.text = text;
  //   });
  // }

  // what runs when send icon is clicked
  void click() {
    FocusScope.of(context).unfocus();
    // calls the callback function from TextInputWidget
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    // user input text
    return TextField(
      // columns of the entered texts
      // puts it at bottom of screen
      controller: controller,
      // input box
      decoration: InputDecoration(
          // msg icon
          prefixIcon: Icon(Icons.message),
          // text holder
          labelText: "Type a message: ",
          labelStyle: TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.blueGrey,
            // shows up on long press
            tooltip: "Msg Message",
            // event when icon is pressed
            onPressed: () => click(),
          )),
      onSubmitted: (text) => click(),
    );
  }
}
