import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

/// @author DeMon
/// Created on 2020/5/26.
/// E-mail 757454343@qq.com
/// Desc:
class DialogUtil {
  static showNormalDialog(BuildContext context, String content, ConfirmCallback confirmCallback, CancelCallback cancelCallback) async {
    bool delete = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('温馨提示'),
            content: SingleChildScrollView(padding: EdgeInsets.all(5.0), child: Text(content)),
            actions: <Widget>[
              FlatButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop()),
              FlatButton(child: Text("确认"), onPressed: () => Navigator.of(context).pop(true))
            ],
          );
        });
    if (delete == null) {
      cancelCallback();
    } else {
      confirmCallback(0);
    }
  }

  static showOptionsDialog(BuildContext context, String title, ConfirmCallback confirmCallback) async {
    int i = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(title: Text(title), children: <Widget>[
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
                onPressed: () => Navigator.pop(context, 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ))
          ]);
        });
    if (i != null) {
      confirmCallback(i);
    }
  }

  static showListDialog(BuildContext context, String title, ConfirmCallback confirmCallback) async {
    int i = await showDialog<int>(
        context: context,
        builder: (context) {
          return Dialog(
              child: Column(
            children: <Widget>[
              ListTile(title: Text(title)),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text("$index"),
                          onTap: () {
                            Navigator.pop(context, index);
                          });
                    },
                    itemCount: 10),
              )
            ],
          ));
        });
    if (i != null) {
      confirmCallback(i);
    }
  }

  static showCheckBoxDialog(BuildContext context, CheckCallback checkCallback) async {
    bool isCheck = false;
    bool delete = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("确定要删除当前文件？"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    Builder(builder: (context) {
                      return Checkbox(
                          value: isCheck,
                          onChanged: (value) {
                            // 此时context为对话框UI的根Element，我们
                            // 直接将对话框UI对应的Element标记为dirty
                            (context as Element).markNeedsBuild();
                            isCheck = !isCheck;
                          });
                    })
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop()),
              FlatButton(child: Text("删除"), onPressed: () => Navigator.of(context).pop(isCheck))
            ],
          );
        });
    if (delete != null) {
      checkCallback(delete);
    }
  }

  static showBottomDialog(BuildContext context, ConfirmCallback confirmCallback) async {
    int index = await showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"), onTap: () => Navigator.of(context).pop(index));
              });
        });
    if (index != null) {
      confirmCallback(index);
    }
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
                width: 250,
                child: AlertDialog(
                    content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 25.0), child: Text("加载中，请稍后...")),
                ]))),
          );
        });
  }

  static showDateTimeDialog(BuildContext context, DateCallback dateCallback) async {
    var date = DateTime.now();
    bool b = await showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 300,
          child: CupertinoDatePicker(
              use24hFormat: true,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime value) {
                date = value;
                print(value);
              }),
        );
      },
    );
    if (b != null) {
      dateCallback(date);
    }
  }

  static showDateTimePickDialog(BuildContext context, DateCallback dateCallback) async {
    var date = DateTime.now();
    DatePicker.showDatePicker(context, initialDateTime: date, pickerMode: DateTimePickerMode.datetime, locale: DateTimePickerLocale.zh_cn, onConfirm: (date, _) {
      dateCallback(date);
    });
  }
}

typedef CancelCallback = void Function();
typedef ConfirmCallback = void Function(int i);

typedef CheckCallback = void Function(bool b);
typedef DateCallback = void Function(DateTime value);
