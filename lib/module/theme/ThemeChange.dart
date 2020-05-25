import 'package:flutter/material.dart';
import 'package:flutter_demo/module/theme/ColorModel.dart';
import 'package:provider/provider.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ThemeChangePage extends StatefulWidget {
  @override
  createState() => new ThemeChangePageState();
}

class ThemeChangePageState extends State<ThemeChangePage> {
  @override
  Widget build(BuildContext context) {
    ColorModel model = Provider.of<ColorModel>(context);
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("主题测试")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //第一行Icon使用主题中的iconTheme
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色跟随主题")]),
          //为第二行Icon自定义颜色（固定为黑色)
          Theme(
            data: themeData.copyWith(
              iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Icon(Icons.favorite), Icon(Icons.airport_shuttle), Text("  颜色固定黑色")]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.change();
          },
          child: Icon(Icons.palette)),
    );
  }
}
