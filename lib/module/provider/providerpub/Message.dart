import 'package:flutter/material.dart';
import 'package:flutter_demo/module/provider/providerpub/MsgModel.dart';
import 'package:flutter_demo/widget/PageBar.dart';
import 'package:provider/provider.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class MessagePage extends StatefulWidget {
  @override
  createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  MsgModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<MsgModel>(
      builder: (context, model, _) {
        this.model = model;
        return Scaffold(
          appBar: PageBar("Message"),
          body: Builder(builder: (context) {
            String count = model.words;
            return Text(count);
          }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pushNamed(context, "/ChangeMessage");
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    //model?.dispose();
  }
}
