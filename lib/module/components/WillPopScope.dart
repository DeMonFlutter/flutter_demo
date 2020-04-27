import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class WillPopScopePage extends StatefulWidget {
  @override
  createState() => new WillPopScopePageState();
}

class WillPopScopePageState extends State<WillPopScopePage> {
  DateTime _lastPressAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressAt == null || DateTime.now().difference(_lastPressAt) > Duration(seconds: 1)) {
          _lastPressAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: CenterScaffold("WillPopScope", <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        )
      ]),
    );
  }
}
