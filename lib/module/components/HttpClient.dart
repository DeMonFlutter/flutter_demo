
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/HttpUtils.dart';
import 'package:flutter_demo/widget/Button.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class HttpClientPage extends StatefulWidget {
  @override
  createState() => new HttpClientPageState();
}

class HttpClientPageState extends State<HttpClientPage> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return CenterScaffold("Http请求", <Widget>[
      Button(context, "GET请求", onPressed: () {
        HttpUtils.instance.getWithParams(context, 'article/list/0/json', {'author': '鸿洋'}, (result) {
          setState(() {
            _text = result;
          });
        });
      }),
      Button(context, "post请求", onPressed: () {
        Map<String, String> map = {'username': 'DeMon', 'password': 'lh1995623'};
        HttpUtils.instance.postDialog(context, 'user/login', map, (result) {
          setState(() {
            _text = result;
          });
        });
      }),
      Text(_text.replaceAll(new RegExp(r"\s"), ""))
    ]);
  }
}
