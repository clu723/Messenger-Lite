import 'package:flutter/material.dart';
import 'package:hello_word/login.dart';
import 'myHomePage.dart';

// what would be ran immedaitely as soon as application is run
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // widgets are what shows up on the screen
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger Lite', // title of app
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.amber),
      // sets the home page as MyHomePage()
      home: LoginPage(),
    );
  }
}
