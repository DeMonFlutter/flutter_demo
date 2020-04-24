import 'package:flutter/material.dart';
import 'package:flutter_demo/module/components/CheckBox.dart';
import 'package:flutter_demo/module/components/ImageView.dart';
import 'package:flutter_demo/module/components/Show.dart';
import 'package:flutter_demo/module/Timer.dart';

import 'module/Home.dart';
import 'module/components/EditText.dart';
import 'module/components/Texts.dart';
import 'module/words/RandomWords.dart';
import 'module/words/SaveWords.dart';

/// @author DeMon
/// Created on 2020/4/24.
/// E-mail 757454343@qq.com
/// Desc:
class Routes {
  static final routes = {
    "/": (context) => HomePage(),
    "Words": (context) => RandomWords(),
    "SaveWords": (context) => SaveWordsPage(ModalRoute.of(context).settings.arguments),
    "Timer": (context) => TimerPage(),
    "Show": (context) => ShowPage(),
    "Texts": (context) => TextsPage(),
    "ImageView": (context) => ImageViewPage(),
    "CheckBox": (context) => CheckBoxPage(),
    "EditText": (context) => EditTextPage()
  };
}
