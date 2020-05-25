import 'package:flutter/material.dart';
import 'package:flutter_demo/module/components/CheckBox.dart';
import 'package:flutter_demo/module/components/ImageView.dart';
import 'package:flutter_demo/module/components/ListView.dart';
import 'package:flutter_demo/module/components/Show.dart';
import 'package:flutter_demo/module/Timer.dart';
import 'package:flutter_demo/module/provider/providerpub/ChangeMessage.dart';
import 'package:flutter_demo/module/provider/providerpub/Message.dart';
import 'package:flutter_demo/module/theme/ThemeChange.dart';

import 'module/Home.dart';
import 'module/components/AsynUI.dart';
import 'module/components/Container.dart';
import 'module/components/CustomScrollView.dart';
import 'module/components/EditText.dart';
import 'module/components/GridView.dart';
import 'module/components/Progress.dart';
import 'module/components/ScrollController.dart';
import 'module/components/WillPopScope.dart';
import 'module/components/scaffold/Scaffold.dart';
import 'module/components/Texts.dart';
import 'module/components/Warp.dart';
import 'module/components/sharedata/ShareDataPage.dart';
import 'module/provider/cart/Cart.dart';
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
    "/SaveWords": (context) => SaveWordsPage(ModalRoute.of(context).settings.arguments),
    "Timer": (context) => TimerPage(),
    "Show": (context) => ShowPage(),
    "Texts": (context) => TextsPage(),
    "ImageView": (context) => ImageViewPage(),
    "CheckBox": (context) => CheckBoxPage(),
    "EditText": (context) => EditTextPage(),
    "Progress": (context) => ProgressPage(),
    "Warp": (context) => WarpPage(),
    "Container": (context) => ContainerPage(),
    "Scaffold": (context) => ScaffoldPage(),
    "ListView": (context) => ListViewPage(),
    "GridView": (context) => GridViewPage(),
    "CustomScrollView": (context) => CustomScrollViewPage(),
    "ScrollController": (context) => ScrollControllerPage(),
    "WillPopScope": (context) => WillPopScopePage(),
    "ShareData": (context) => ShareDataPage(),
    "Cart": (context) => CartPage(),
    "Message": (context) => MessagePage(),
    "/ChangeMessage": (context) => ChangeMessagePage(),
    "Theme": (context) => ThemeChangePage(),
    "AsynUI": (context) => AsynUIPage(),
  };
}
