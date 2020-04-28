import 'package:flutter/cupertino.dart';

import 'ChangeNotifierProvider.dart';

/// @author DeMon
/// Created on 2020/4/28.
/// E-mail 757454343@qq.com
/// Desc:
class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
