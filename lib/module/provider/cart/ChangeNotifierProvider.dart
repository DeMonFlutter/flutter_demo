import 'package:flutter/material.dart';
import 'InheritedProvider.dart';

/// @author DeMon
/// Created on 2020/4/23.
/// E-mail 757454343@qq.com
/// Desc:
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider.data;
  }

  @override
  createState() => new ChangeNotifierProviderState<T>();
}

class ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {

  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
  }

  @override
  void initState() {
    super.initState();
    // 给model添加监听器
    widget.data.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();
    // 移除model的监听器
    widget.data.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}