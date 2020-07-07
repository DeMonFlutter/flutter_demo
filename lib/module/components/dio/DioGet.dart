import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../Main.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class DioGetPage extends StatefulWidget {
  @override
  createState() => new DioGetPageState();
}

class DioGetPageState extends State<DioGetPage> {
  var futureBuilder = FutureBuilder(
      future: dio.get("/article/list/0/json", queryParameters: {'author': '鸿洋'}),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //请求完成
        if (snapshot.connectionState == ConnectionState.done) {
          //发生错误
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          //请求成功，通过项目信息构建用于显示项目名称的ListView
          Response response = snapshot.data;
          var datas = response.data["data"]["datas"];
          return ListView(
            shrinkWrap: true,
            children: datas.map<Widget>((e) => ListTile(title: Text(e["title"]))).toList(),
          );
        }
        //请求未完成时弹出loading
        return CircularProgressIndicator();
      });

  @override
  Widget build(BuildContext context) {
    return Center(child: futureBuilder);
  }
}
