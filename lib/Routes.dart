import 'package:flutter/material.dart';
import 'package:flutter_demo/module/components/Gobang.dart';
import 'package:flutter_demo/module/components/CheckBox.dart';
import 'package:flutter_demo/module/components/HttpClient.dart';
import 'package:flutter_demo/module/components/ImageView.dart';
import 'package:flutter_demo/module/components/ListView.dart';
import 'package:flutter_demo/module/components/Notification.dart';
import 'package:flutter_demo/module/components/Show.dart';
import 'package:flutter_demo/module/Timer.dart';
import 'package:flutter_demo/module/components/TurnWidget.dart';
import 'package:flutter_demo/module/provider/providerpub/ChangeMessage.dart';
import 'package:flutter_demo/module/provider/providerpub/Message.dart';
import 'package:flutter_demo/module/theme/ThemeChange.dart';

import 'module/Home.dart';
import 'module/components/AsynUI.dart';
import 'module/components/Container.dart';
import 'module/components/CustomScrollView.dart';
import 'module/components/Socket.dart';
import 'module/components/dio/Dio.dart';
import 'module/components/FileOperation.dart';
import 'module/components/dialog/Dialog.dart';
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
    "官方入门Demo": (context) => RandomWords(),
    "/SaveWords": (context) => SaveWordsPage(ModalRoute.of(context).settings.arguments),
    "入门计数Demo": (context) => TimerPage(),
    "SnackBar组件": (context) => ShowPage(),
    "Text文本": (context) => TextsPage(),
    "ImageView图片": (context) => ImageViewPage(),
    "CheckBox选择框": (context) => CheckBoxPage(),
    "EditText输入框": (context) => EditTextPage(),
    "Progress进度条": (context) => ProgressPage(),
    "Warp自适应布局": (context) => WarpPage(),
    "Container容器": (context) => ContainerPage(),
    "Scaffold路由页": (context) => ScaffoldPage(),
    "ListView列表": (context) => ListViewPage(),
    "GridView表格": (context) => GridViewPage(),
    "CustomScrollView沉浸式": (context) => CustomScrollViewPage(),
    "ScrollController滚动控制": (context) => ScrollControllerPage(),
    "WillPopScope返回键拦截": (context) => WillPopScopePage(),
    "InheritedWidget数据共享": (context) => ShareDataPage(),
    "Provider跨组件状态共享": (context) => CartPage(),
    "Provider插件页面消息传递": (context) => MessagePage(),
    "/ChangeMessage": (context) => ChangeMessagePage(),
    "Theme实现全局换肤": (context) => ThemeChangePage(),
    "AsynUI异步更新UI": (context) => AsynUIPage(),
    "Dialog对话框": (context) => DialogPage(),
    "Notification通知机制": (context) => NotificationPage(),
    "TurnWidget旋转组件": (context) => TurnWidgetPage(),
    "Gobang绘制围棋": (context) => GobangPage(),
    "FileOperation文件操作": (context) => FileOperationPage(),
    "HttpClient网络请求": (context) => HttpClientPage(),
    "Dio插件进行网络请求": (context) => DioPage(),
    "WebSocket通信": (context) => SocketPage()
  };
}
