import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class NotificationPage extends StatefulWidget {
  @override
  createState() => new NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageBar("Home"),
        body: NotificationListener(
          onNotification: (notification) {
            switch (notification.runtimeType) {
              case ScrollStartNotification:
                print("开始滚动");
                break;
              case ScrollUpdateNotification:
                print("正在滚动");
                break;
              case ScrollEndNotification:
                print("滚动停止");
                break;
              case OverscrollNotification:
                print("滚动到边界");
                break;
            }
          },
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              }),
        ));
  }
}
