import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/PageBar.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class EditTextPage extends StatefulWidget {
  @override
  createState() => new EditTextPageState();
}

class EditTextPageState extends State<EditTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar("TextField"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(labelText: "用户名", hintText: "请输入用户名", prefixIcon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                  onChanged: (text) {
                    print(text);
                  }),
              TextFormField(
                decoration: InputDecoration(labelText: "密码", hintText: "请输入密码", prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
                onChanged: (text) {
                  print(text);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Builder(
                      builder: (context) {
                        return FlatButton(
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                print("验证通过");
                              }
                            });
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
