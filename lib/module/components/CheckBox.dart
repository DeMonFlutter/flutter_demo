import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class CheckBoxPage extends StatefulWidget {
  @override
  createState() => new CheckBoxPageState();
}

class CheckBoxPageState extends State<CheckBoxPage> {
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return CenterScaffold("CheckBox", <Widget>[
      Switch(
          value: _switch,
          onChanged: (value) {
            setState(() {
              _switch = value;
            });
          }),
      Checkbox(
          value: _switch,
          onChanged: (value) {
            setState(() {
              _switch = value;
            });
          })
    ]);
  }
}
