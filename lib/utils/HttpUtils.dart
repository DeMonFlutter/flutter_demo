import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/module/components/dialog/DialogUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

/// @author DeMon
/// Created on 2020/6/29.
/// E-mail 757454343@qq.com
/// Desc:
class HttpUtils {
  factory HttpUtils() => getInstance();

  HttpUtils._internal();

  static HttpUtils _instance;

  static HttpUtils get instance => getInstance();

  static HttpUtils getInstance() {
    if (_instance == null) {
      _instance = new HttpUtils._internal();
    }
    return _instance;
  }

  ///此处使用WanAndroid开放Api
  ///   注意post请求需要提交表单
  String baseUrl = 'https://www.wanandroid.com/';

  getNoParams(BuildContext context, String url, HttpCallback callback) {
    get(context, url, null, true, callback);
  }

  getWithParams(BuildContext context, String url, Map<String, String> map, HttpCallback callback) {
    if (map != null && map.isNotEmpty) {
      url += '?'; //开始拼接参数
      map.keys.forEach((key) {
        url += '$key=${map[key]}&';
      });
      url = url.substring(0, url.length - 1); //去掉最后一个&
      print(url);
    }
    get(context, url, map, true, callback);
  }

  get(BuildContext context, String url, Map<String, String> map, bool isShowDialog, HttpCallback callback) {
    Future.sync(() async {
      if (isShowDialog) {
        DialogUtil.showHttpDialog(context);
      }
      var response = await http.get(baseUrl + url);
      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        throw ('${response.statusCode}');
      }
    }).then((value) {
      callback(value);
    }).catchError((e) {
      print('$e');
      Fluttertoast.showToast(msg: '请求失败：$e');
    }).whenComplete(() {
      if (isShowDialog) {
        Navigator.of(context).pop();
      }
    });
  }

  postDialog(BuildContext context, String url, Map<String, String> map, HttpCallback callback) {
    post(context, url, map, true, callback);
  }

  post(BuildContext context, String url, Map<String, String> map, bool isShowDialog, HttpCallback callback) {
    Future.sync(() async {
      if (isShowDialog) {
        DialogUtil.showHttpDialog(context);
      }
      //body可以是string Json，Map表单，List二进制流
      var response = await http.post(baseUrl + url, body: map);
      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        throw ('${response.statusCode}');
      }
    }).then((value) {
      callback(value);
    }).catchError((e) {
      print('$e');
      Fluttertoast.showToast(msg: '请求失败：$e');
    }).whenComplete(() {
      if (isShowDialog) {
        Navigator.of(context).pop();
      }
    });
  }
}

typedef HttpCallback = void Function(String result);
