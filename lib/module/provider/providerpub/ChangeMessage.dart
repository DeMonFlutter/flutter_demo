import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';
import 'package:provider/provider.dart';

import 'MsgModel.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ChangeMessagePage extends StatefulWidget {
  @override
  createState() => new ChangeMessagePageState();
}

class ChangeMessagePageState extends State<ChangeMessagePage> {
  @override
  Widget build(BuildContext context) {
    MsgModel model = Provider.of<MsgModel>(context);
    return CenterScaffold("ChangeMessage", <Widget>[
      Text(model.words),
      RaisedButton(
          child: Text("Change"),
          onPressed: () {
            model.change();
          })
    ]);
  }
}
