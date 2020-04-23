import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class Button extends RaisedButton {
  Button(String text, var fun) :super(child: Text(text), onPressed: fun);
}
