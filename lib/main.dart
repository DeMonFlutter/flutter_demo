
import 'package:flutter/material.dart';
import 'package:flutter_demo/Timer.dart';
import 'package:flutter_demo/words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'My App',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new TimerPage());
  }
}
