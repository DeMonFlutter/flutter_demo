import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/5/6.
/// E-mail 757454343@qq.com
/// Desc:
class ColorModel extends ChangeNotifier {
  Color themeColor = Colors.blue; //当前路由主题色
  Color themeColorDark = Colors.blue[700]; //当前路由主题色的深色
  change() {
    themeColorDark = themeColor == Colors.blue ? Colors.teal[700] : Colors.blue[700];
    themeColor = themeColor == Colors.blue ? Colors.teal : Colors.blue;
    notifyListeners();
  }
}
