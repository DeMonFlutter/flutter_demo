import 'package:flutter/material.dart';
import 'package:flutter_demo/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class TimerPage extends StatefulWidget {
  @override
  createState() => new TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PageBar("Timer"),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You have Pressed the button this many times"),
            new Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _fbPressed,
        child: new Icon(Icons.add_box),
      ),
    );
  }

  void _fbPressed() {
    setState(() {
      count++;
    });
  }
}
