import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

import 'ShareData.dart';
import 'TextWidget.dart';

/// @author DeMon
/// Created on 2020/4/28.
/// E-mail 757454343@qq.com
/// Desc:
class ShareDataPage extends StatefulWidget {
  @override
  createState() => ShareDataPageState();
}

class ShareDataPageState extends State<ShareDataPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      //使用ShareDataWidget
      data: count,
      child: CenterScaffold("ShareData", <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: TextWidget(), //子widget中依赖ShareDataWidget
        ),
        RaisedButton(
          child: Text("Increment"),
          //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
          onPressed: () => setState(() => ++count),
        )
      ]),
    );
  }
}
