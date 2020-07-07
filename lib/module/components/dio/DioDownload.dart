import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/FileUtils.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class DioDownloadPage extends StatefulWidget {
  @override
  createState() => new DioDownloadPageState();
}

var dio = Dio();

class DioDownloadPageState extends State<DioDownloadPage> {
  @override
  void initState() {
    super.initState();
  }

  var futureBuilder = FutureBuilder(
      future: dio.download("https://avatar.csdnimg.cn/3/0/B/3_demonliuhui.jpg", "/data/user/0/com.example.flutter_demo/app_flutter/demon1.jpg", onReceiveProgress: (c, t) {
        print("count=$c, total=$t");
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //请求完成
        if (snapshot.connectionState == ConnectionState.done) {
          //发生错误
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          //请求成功，通过项目信息构建用于显示项目名称的ListView
          Response response = snapshot.data;
          return  Image.file(File("/data/user/0/com.example.flutter_demo/app_flutter/demon1.jpg"));
        }
        //请求未完成时弹出loading
        return CircularProgressIndicator();
      });

  @override
  Widget build(BuildContext context) {
    return Center(child: futureBuilder);
  }
}
