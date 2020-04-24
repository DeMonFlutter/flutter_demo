import 'package:flutter/material.dart';
import 'package:flutter_demo/Routes.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

import '../widget/Button.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    Routes.routes.forEach((e, s) {
      if (e != "/") {
        list.add(Button(context, e));
      }
    });
    return CenterScaffold("Home", list);
  }
}
