import 'package:flutter/material.dart';

import 'ShareData.dart';

/// @author DeMon
/// Created on 2020/4/28.
/// E-mail 757454343@qq.com
/// Desc:
class TextWidget extends StatefulWidget {
  @override
  createState() => TestWidgetState();
}

class TestWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    ShareDataWidget shareDataWidget = ShareDataWidget.of(context);
    if (shareDataWidget == null) {
      return Text("ShareDataWidget null");
    }

    if (shareDataWidget.data == null) {
      return Text("data null");
    }

    return Text(shareDataWidget.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
