import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/26.
/// E-mail 757454343@qq.com
/// Desc:
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 38.0, 16.0, 16.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: ClipOval(child: Image.asset("images/avatar.png", width: 80)),
                    ),
                    Text("DeMon", style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(leading: Icon(Icons.add), title: Text("Add account")),
                    ListTile(leading: Icon(Icons.settings), title: Text("Setting")),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
