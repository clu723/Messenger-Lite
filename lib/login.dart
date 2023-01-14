import 'package:flutter/material.dart';
import 'package:hello_word/MyHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // adds a bar on top of screen
        appBar: AppBar(
          title: const Text("Log In"),
        ),
        // body content of app
        body: Body());
  }
}

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String userName;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.userName = controller.text;
    // push = go to that page; pop = go back to previous page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              // text holder
              labelText: "Type your User Name: ",
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: Colors.black)),
              suffixIcon: IconButton(
                icon: Icon(Icons.done),
                splashColor: Colors.blueGrey,
                // shows up on long press
                tooltip: "Submit",
                // event when icon is pressed
                onPressed: () => {click()},
              )),
        ),
      ),
    );
  }
}
