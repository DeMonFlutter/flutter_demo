import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class TimerPage extends StatefulWidget {
  @override
  createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("Timer"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have Pressed the button this many times"),
            Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fbPressed,
        child: Icon(Icons.add_box),
      ),
    );
  }

  void _fbPressed() {
    setState(() {
      count++;
    });
  }
}
