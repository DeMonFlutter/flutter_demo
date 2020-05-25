import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class Button extends RaisedButton {
  Button(BuildContext context, String text)
      : super(
            child: Text(text),
            onPressed: () {
              Navigator.pushNamed(context, text);
            },
            color: Theme.of(context).accentColor,
            highlightColor: Theme.of(context).primaryColorDark,
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)));
}
