import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:hello/favorite.dart';
import 'package:hello/random.dart'; // add this line by seo

void main() {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  enableFlutterDriverExtension();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      routes: <String, WidgetBuilder>{
        "/favorite": (BuildContext context) => FavoriteWords(null)
      },
    );
  }
}
