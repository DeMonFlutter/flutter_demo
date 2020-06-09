import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';
import 'package:flutter_demo/widget/TurnBox.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class TurnWidgetPage extends StatefulWidget {
  @override
  createState() => new TurnWidgetPageState();
}

class TurnWidgetPageState extends State<TurnWidgetPage> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return CenterScaffold("TurnWidget", <Widget>[
      TurnBox(
        turns: _turns,
        speed: 500,
        child: Icon(
          Icons.refresh,
          size: 50,
        ),
      ),
      TurnBox(
        turns: _turns,
        speed: 2000,
        child: Icon(
          Icons.refresh,
          size: 150.0,
        ),
      ),
      RaisedButton(
        child: Text("顺时针旋转1/2圈"),
        onPressed: () {
          setState(() {
            _turns += .5;
          });
        },
      ),
      RaisedButton(
        child: Text("逆时针旋转1/2圈"),
        onPressed: () {
          setState(() {
            _turns -= .5;
          });
        },
      )
    ]);
  }
}
