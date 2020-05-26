import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ShowPage extends StatefulWidget {
  @override
  createState() => new ShowPageState();
}

class ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("Show"),
      body: Center(child: Builder(
        builder: (context) {
          return RaisedButton(
              child: Text("showSnackBar"),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("我是SnackBar"),
                ));
              });
        },
      )),
    );
  }
}
