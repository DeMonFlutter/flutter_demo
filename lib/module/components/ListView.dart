import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ListViewPage extends StatefulWidget {
  @override
  createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageBar("ListView"),
        body: Column(
          children: <Widget>[
            ListTile(title: Text("名字列表")),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(alignment: Alignment.center, padding: EdgeInsets.all(16.0), child: SizedBox(width: 24.0, height: 24.0, child: CircularProgressIndicator()));
                    } else {
                      return Container(alignment: Alignment.center, padding: EdgeInsets.all(16.0), child: Text("没有更多数据了~", style: TextStyle(color: Colors.grey)));
                    }
                  }
                  return ListTile(title: Text(_words[index]));
                },
                separatorBuilder: (context, index) => Divider(height: .0),
                itemCount: _words.length,
              ),
            )
          ],
        ));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1, generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
