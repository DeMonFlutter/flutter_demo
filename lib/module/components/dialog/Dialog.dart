import 'package:flutter/material.dart';
import 'package:flutter_demo/module/components/dialog/DialogUtil.dart';
import 'package:flutter_demo/widget/CenterScaffold.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class DialogPage extends StatefulWidget {
  @override
  createState() => new DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return CenterScaffold("Dialog", <Widget>[
      RaisedButton(
          child: Text('普通对话框'),
          onPressed: () {
            DialogUtil.showNormalDialog(context, "是否确认删除？", (i) {
              print("普通对话框---确认");
            }, () {
              print("普通对话框---取消");
            });
          }),
      RaisedButton(
          child: Text('选项对话框'),
          onPressed: () {
            DialogUtil.showOptionsDialog(context, "请选择", (i) {
              print("选项对话框选择了：${i == 1 ? "中文简体" : "美国英语"}");
            });
          }),
      RaisedButton(
          child: Text('列表对话框'),
          onPressed: () {
            DialogUtil.showListDialog(context, "请选择", (i) {
              print("列表对话框选择了：$i");
            });
          }),
      RaisedButton(
          child: Text('带CheckBox的对话框'),
          onPressed: () {
            DialogUtil.showCheckBoxDialog(context, (i) {
              print("带CheckBox的对话框选择了：$i");
            });
          }),
      RaisedButton(
          child: Text('底部对话框'),
          onPressed: () {
            DialogUtil.showBottomDialog(context, (i) {
              print("底部对话框选择了：$i");
            });
          }),
      RaisedButton(
          child: Text('Loading'),
          onPressed: () {
            DialogUtil.showLoadingDialog(context);
          }),
      RaisedButton(
          child: Text('时间选择'),
          onPressed: () {
            DialogUtil.showDateTimeDialog(context, (data) {
              print("时间选择了：$data");
            });
          }),RaisedButton(
          child: Text('第三方库时间选择'),
          onPressed: () {
            DialogUtil.showDateTimePickDialog(context, (data) {
              print("第三方库时间选择了：$data");
            });
          }),
    ]);
  }
}
