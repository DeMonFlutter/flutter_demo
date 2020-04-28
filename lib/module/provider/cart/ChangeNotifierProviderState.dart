import 'package:flutter/material.dart';

import 'ChangeNotifierProvider.dart';
import 'InheritedProvider.dart';

/// @author DeMon
/// Created on 2020/4/28.
/// E-mail 757454343@qq.com
/// Desc: 
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
