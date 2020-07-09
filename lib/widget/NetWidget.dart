import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @author DeMon
/// Created on 2020/7/1.
/// E-mail 757454343@qq.com
/// Desc:

class NetWidget extends StatelessWidget {
  NetWidget(this.future);

  final Future future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Response response = snapshot.data as Response;
          if (snapshot.hasError) {
            // 请求失败，显示错误
            Fluttertoast.showToast(msg: "Error: ${snapshot.error}");
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return ListView(children: response.data.map<Widget>((e) => ListTile(title: Text(e['full_name']))).toList());
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
