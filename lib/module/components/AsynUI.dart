import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class AsynUIPage extends StatefulWidget {
  @override
  createState() => new AsynUIPageState();
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class AsynUIPageState extends State<AsynUIPage> {
  StreamController<int> streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (i) {
      streamController.sink.add(i.tick);
    });
    //streamController.addStream(counter());
  }

  var futureBuilder = FutureBuilder<String>(
    future: mockNetworkData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          // 请求失败，显示错误
          return Text("Error: ${snapshot.error}");
        } else {
          // 请求成功，显示数据
          return Text("Contents: ${snapshot.data}");
        }
      } else {
        return CircularProgressIndicator();
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return CenterScaffold("AsynUI", <Widget>[
      futureBuilder,
      StreamBuilder<int>(
        stream: streamController.stream, //
        //initialData: ,// a Stream<int> or null
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return null; // unreachable
        },
      ),
      RaisedButton(
        child: Text('Stop'),
        onPressed: () {
          streamController.close();
        },
      )
    ]);
  }
}
