import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class FileOperationPage extends StatefulWidget {
  @override
  createState() => new FileOperationPageState();
}

class FileOperationPageState extends State<FileOperationPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //_readCount();
  }

  _readCount() {
  }

  _incrementCounter() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("文件操作"),
      body: new Center(
        child: new Text('点击了 $_counter 次'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
