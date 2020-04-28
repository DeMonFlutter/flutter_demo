import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// @author DeMon
/// Created on 2020/4/28.
/// E-mail 757454343@qq.com
/// Desc:
class MsgModel with ChangeNotifier {
  String words = "HelloWorld";

  change() {
    words = generateWordPairs().take(1).first.asPascalCase;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    words = "HelloWorld";
    notifyListeners();
  }
}
