import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/LoginBean.dart';

import '../../../Main.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class DioPostPage extends StatefulWidget {
  @override
  createState() => new DioPostPageState();
}

class DioPostPageState extends State<DioPostPage> {
  var futureBuilder = FutureBuilder(
      // ignore: top_level_instance_method
      future: dio.post("/user/login", data: new FormData.fromMap({'username': 'DeMon', 'password': 'lh1995623'})),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //请求完成
        if (snapshot.connectionState == ConnectionState.done) {
          //发生错误
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          //请求成功，通过项目信息构建用于显示项目名称的ListView
          Response response = snapshot.data;
          var bean = LoginBean.fromJson(response.data).data;
          return Text("${bean.id}  ${bean.nickname}");
        }
        //请求未完成时弹出loading
        return CircularProgressIndicator();
      });

  @override
  Widget build(BuildContext context) {
    return Center(child: futureBuilder);
  }
}
