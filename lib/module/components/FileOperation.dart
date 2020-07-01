import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/FileUtils.dart';
import 'package:flutter_demo/utils/SPUtils.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class FileOperationPage extends StatefulWidget {
  @override
  createState() => FileOperationPageState();
}

class FileOperationPageState extends State<FileOperationPage> {
  int _counter = 0;
  int _counter2 = 0;

  @override
  void initState() {
    super.initState();
    //_readCount();
    FileUtils.readFile("counter.txt").then((String value) {
      setState(() {
        if (value.isEmpty) {
          _counter = 0;
        } else {
          _counter = int.parse(value);
        }
      });
    });

    SPUtils.getData("counter", 0).then((int onValue) {
      setState(() {
        _counter2 = onValue;
      });
    });
  }

  _incrementCounter() {
    setState(() {
      _counter++;
      _counter2++;
    });
    FileUtils.writeFile("counter.txt", "$_counter");
    SPUtils.setData("counter", _counter2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("文件操作"),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('File 点击了 $_counter 次'),
            Text('SharedPreferences  点击了 $_counter2 次'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
