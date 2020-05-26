import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/24.
/// E-mail 757454343@qq.com
/// Desc:
class TextsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold("Text", <Widget>[
      Text(
        "Hello world",
        style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: "Courier",
            background: new Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed),
      ),
      Text.rich(
        TextSpan(children: [TextSpan(text: "Home:"), TextSpan(text: "https://www.baidu.com/", style: TextStyle(color: Colors.blue))]),
      )
    ]);
  }
}
